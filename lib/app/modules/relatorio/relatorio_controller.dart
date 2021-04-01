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
  getSpotsLast({int time = 15}) {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));
    DateTime dataHj = DateTime.now();
    DateTime dataInicio = DateTime.now().subtract(Duration(days: time));
    return values
        .where((data) =>
            data.data.isAfter(dataInicio) && data.data.isBefore(dataHj))
        .map((spot) => FlSpot(
              values.indexOf(spot).toDouble(),
              spot.qtdAtual,
            ))
        .toList();
  }

  @action
  getSpotsMonth(int mes) {
    List<HistoricoNivel> values = listHistNivel.data;
    values.sort((a, b) => a.data.compareTo(b.data));
    List<HistoricoNivel> aux =
        values.where((data) => data.data.month == mes).toList();
    print(aux);
    List<FlSpot> spots = new List<FlSpot>();

    spots.add(
        new FlSpot(1, mean(aux.where((spot) => spot.data.day <= 7).toList())));
    spots.add(new FlSpot(
        2,
        mean(aux
            .where((spot) => spot.data.day > 7 && spot.data.day <= 14)
            .toList())));
    spots.add(new FlSpot(
        3,
        mean(aux
            .where((spot) => spot.data.day > 14 && spot.data.day <= 21)
            .toList())));
    spots.add(new FlSpot(
        4,
        mean(aux
            .where((spot) => spot.data.day > 21 && spot.data.day <= 28)
            .toList())));
    spots.add(
        new FlSpot(5, mean(aux.where((spot) => spot.data.day > 28).toList())));

    return spots;
  }

  mean(List<HistoricoNivel> list) {
    double sum = 0;

    list.forEach((element) {
      sum = sum + element.qtdAtual;
    });

    return double.parse((sum / list.length).toStringAsPrecision(4));
  }
}
