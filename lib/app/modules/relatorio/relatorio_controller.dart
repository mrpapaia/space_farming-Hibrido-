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
  List<FlSpot> listSpot;

  List<String> nomesLastDays = List<String>();
  _RelatorioControllerBase(
      this.repositoryHistNivel, this.repositoryHistAbastecimento, this.bot) {
    getHistoricoAbastecimento();
    getHistoricoNivel();
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
  getAllSpots() {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));

    return values
        .map((data) => FlSpot(
              values.indexOf(data).toDouble(),
              data.qtdAtual,
            ))
        .toList();
  }

  @action
  getSpotsLastDays({int time = 15}) {
    nomesLastDays = List<String>();
    int index = 0;
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));
    DateTime dataHj = DateTime.now();
    DateTime dataInicio = DateTime.now().subtract(Duration(days: time));
    List<FlSpot> spots = values
        .where(
      (data) => data.data.isAfter(dataInicio) && data.data.isBefore(dataHj),
    )
        .map((spot) {
      nomesLastDays
          .add(spot.data.day.toString() + "/" + spot.data.month.toString());
      FlSpot spotaux = FlSpot(
        index.toDouble(),
        spot.qtdAtual,
      );
      index = index + 1;
      return spotaux;
    }).toList();
    print(spots);
    return spots;
  }

  @action
  getSpotsPerMonth(int mes) {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));
    List<HistoricoNivel> aux =
        values.where((data) => data.data.month == mes).toList();

    List<FlSpot> spots = new List<FlSpot>();

    spots.add(
        new FlSpot(1, _mean(aux.where((spot) => spot.data.day <= 7).toList())));
    spots.add(new FlSpot(
        2,
        _mean(aux
            .where((spot) => spot.data.day > 7 && spot.data.day <= 14)
            .toList())));
    spots.add(new FlSpot(
        3,
        _mean(aux
            .where((spot) => spot.data.day > 14 && spot.data.day <= 21)
            .toList())));
    spots.add(new FlSpot(
        4,
        _mean(aux
            .where((spot) => spot.data.day > 21 && spot.data.day <= 28)
            .toList())));
    spots.add(
        new FlSpot(5, _mean(aux.where((spot) => spot.data.day > 28).toList())));

    return spots;
  }

  @action
  getSpotsLastMonth({int time = 6}) {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));

    DateTime dataHj = DateTime.now();
    DateTime dataInicio = DateTime.now().subtract(Duration(days: time * 30));
    List<HistoricoNivel> aux = values
        .where((data) =>
            data.data.isAfter(dataInicio) && data.data.isBefore(dataHj))
        .toList();
    List<FlSpot> spots = new List<FlSpot>();
    for (int i = dataInicio.month; i <= dataHj.month; i++) {
      spots.add(new FlSpot(i.toDouble(),
          _mean(aux.where((spot) => spot.data.month == i).toList())));
    }
    return spots;
  }

  @action
  getSpotsPerYear(int year) {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));
    List<HistoricoNivel> aux =
        values.where((data) => data.data.year == year).toList();

    List<FlSpot> spots = new List<FlSpot>();
    for (int i = 1; i <= 12; i++) {
      spots.add(new FlSpot(i.toDouble(),
          _mean(aux.where((spot) => spot.data.month == i).toList())));
    }
    return spots;
  }

  _mean(List<HistoricoNivel> list) {
    double sum = 0;

    list.forEach((element) {
      sum = sum + element.qtdAtual;
    });

    return double.parse((sum / list.length).toStringAsPrecision(4));
  }
}
