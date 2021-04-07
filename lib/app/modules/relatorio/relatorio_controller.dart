import 'package:fl_chart/fl_chart.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

part 'relatorio_controller.g.dart';

@Injectable()
class RelatorioController = _RelatorioControllerBase with _$RelatorioController;

abstract class _RelatorioControllerBase with Store {
  final IRepositoryHistoricoNivel repositoryHistNivel;
  final IRepositoryHistoricoAbastecimento repositoryHistAbastecimento;

  final Botijao bot;
  @observable
  ObservableStream<List<HistoricoNivel>> listHistNivel;

  @observable
  ObservableStream<List<HistoricoAbastecimento>> listHistAbastecimento;

  @observable
  List<FlSpot> listSpotsDays;

  @observable
  List<FlSpot> listSpotsWeek;
  @observable
  List<FlSpot> listSpotsMonth;

  @observable
  List<String> nomesDays = List<String>();

  @observable
  List<String> nomesWeek;
  @observable
  int selectedRadio = 1;
  List<String> months = [
    "jan.",
    " fev.",
    "mar.",
    "abr.",
    "maio",
    "jun.",
    "jul.",
    "ago.",
    " set.",
    " out. ",
    "nov.",
    "dez."
  ];

  @observable
  List<String> nomesMonth;
  @observable
  int x = 0;

  @observable
  List<bool> isSelected = [false, false, false];
  _RelatorioControllerBase(
      this.repositoryHistNivel, this.repositoryHistAbastecimento, this.bot) {
    getHistoricoAbastecimento();
    getHistoricoNivel();
  }

  @action
  teste(value) => x = value;

  @action
  setSelected(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[index] = true;
        x = index;
      } else {
        isSelected[i] = false;
      }
    }
  }

  @action
  getHistoricoNivel() {
    listHistNivel = repositoryHistNivel.list(bot.ref).asObservable();
  }

  @action
  getHistoricoAbastecimento() {
    listHistAbastecimento =
        repositoryHistAbastecimento.list(bot.ref).asObservable();
  }

  @action
  getSpots({int days, int month, int year, DateTime inicio, DateTime fim}) {
    List<HistoricoNivel> values = listHistNivel.data;
    List<HistoricoNivel> valuesAux;
    nomesDays = List<String>();
    nomesMonth = List<String>();
    nomesWeek = List<String>();
    listSpotsDays = List();
    listSpotsMonth = List();
    listSpotsWeek = List();
    int index = 0;
    double mean;
    values.sort((a, b) => a.data.compareTo(b.data));
    if (days != null) {
      DateTime dataHj = DateTime.now();
      DateTime dataInicio = DateTime.now().subtract(Duration(days: days));
      valuesAux = values
          .where(
            (data) =>
                data.data.isAfter(dataInicio) && data.data.isBefore(dataHj),
          )
          .toList();
    } else if (month != null && year != null) {
      valuesAux = values
          .where(
            (data) => data.data.month == month && data.data.year == year,
          )
          .toList();
    } else if (month != null) {
      valuesAux = values
          .where(
            (data) =>
                data.data.month == month &&
                data.data.year == DateTime.now().year,
          )
          .toList();
    } else if (year != null) {
      valuesAux = values
          .where(
            (data) => data.data.year == year,
          )
          .toList();
    }

    DateTime dateCrtl = valuesAux[0].data;
    int c = 1;
    int auxMes = 1;
    for (int i = 0; i < c; i++) {
      mean = _mean(valuesAux
          .where((spot) =>
              spot.data.isAfter(_findFirstDateOfTheWeek(dateCrtl)) &&
              spot.data.isBefore(_findLastDateOfTheWeek(dateCrtl)))
          .toList());
      if (!mean.isNaN) {
        listSpotsWeek.add(new FlSpot(i.toDouble(), mean));
        if (_findLastDateOfTheWeek(dateCrtl).day < 7) {
          nomesWeek.add("4º/" + dateCrtl.month.toString());
        } else {
          nomesWeek.add("${auxMes}º/" + dateCrtl.month.toString());
        }
        auxMes++;
        if (dateCrtl.month !=
            _findLastDateOfTheWeek(dateCrtl).add(Duration(days: 1)).month) {
          auxMes = 1;
        }

        c++;
      }
      dateCrtl = _findLastDateOfTheWeek(dateCrtl).add(Duration(days: 1));
    }

    for (int i = 0; i < 12; i++) {
      mean =
          _mean(valuesAux.where((spot) => spot.data.month == i + 1).toList());

      if (!mean.isNaN) {
        listSpotsMonth.add(new FlSpot(i.toDouble(), mean));
        nomesMonth.add(months[i]);
      } else {
        nomesMonth.add("");
      }
    }
    listSpotsDays = valuesAux.map((spot) {
      nomesDays
          .add(spot.data.day.toString() + "/" + spot.data.month.toString());
      FlSpot spotaux = FlSpot(
        index.toDouble(),
        spot.qtdAtual,
      );
      index = index + 1;
      return spotaux;
    }).toList();
  }

  _mean(List<HistoricoNivel> list) {
    double sum = 0;

    list.forEach((element) {
      sum = sum + element.qtdAtual;
    });

    return double.parse((sum / list.length).toStringAsPrecision(4));
  }

  DateTime _findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime _findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }
}
