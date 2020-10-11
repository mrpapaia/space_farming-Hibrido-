import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

part 'historico_controller.g.dart';

@Injectable()
class HistoricoController = _HistoricoControllerBase with _$HistoricoController;

abstract class _HistoricoControllerBase with Store {
  final IRepositoryHistoricoNivel repositoryHistNivel;
  final IRepositoryHistoricoAbastecimento repositoryHistAbastecimento;

  @observable
  ObservableStream<List<HistoricoNivel>> listHistNivel;

  @observable
  ObservableStream<List<HistoricoAbastecimento>> listHistAbastecimento;

  _HistoricoControllerBase(
      this.repositoryHistNivel, this.repositoryHistAbastecimento) {
    getHistoricoNivel();
    getHistoricoAbastecimento();
  }

  @action
  getHistoricoNivel() {
    listHistNivel = repositoryHistNivel.list().asObservable();
  }

  @action
  getHistoricoAbastecimento() {
    listHistAbastecimento = repositoryHistAbastecimento.list().asObservable();
  }
}
