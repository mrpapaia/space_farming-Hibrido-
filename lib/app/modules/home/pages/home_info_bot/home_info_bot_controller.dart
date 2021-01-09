import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

part 'home_info_bot_controller.g.dart';

@Injectable()
class HomeInfoBotController = _HomeInfoBotControllerBase
    with _$HomeInfoBotController;

abstract class _HomeInfoBotControllerBase with Store {
  final Botijao botijao;
  final UserP user;
  final IRepositoryCanecas repositoryCanecas;
  final IRepositoryHistoricoAbastecimento repositoryHistoricoAbastecimento;
  final IRepositoryHistoricoNivel repositoryHistoricoNivel;

  final IRepositoryBotijao repositoryBotijao;

  double volAnterior;
  _HomeInfoBotControllerBase(
      {this.repositoryHistoricoNivel,
      this.repositoryHistoricoAbastecimento,
      this.repositoryBotijao,
      this.repositoryCanecas,
      this.botijao,
      this.user}) {
    volAnterior = this.botijao.volAtual;
  }

  @action
  getNivel(value) {
    botijao.volAtual = value;
  }

  abastecer() {
    repositoryBotijao
        .updateVol(new Botijao(ref: botijao.ref, volAtual: botijao.volAtual));
    repositoryHistoricoAbastecimento.add(
        botijao.ref,
        new HistoricoAbastecimento(
            respon: user.nome,
            qtdAtual: botijao.volAtual,
            qtdAdd: botijao.volAtual - volAnterior,
            data: Timestamp.now().toDate(),
            preco: 0.0));
  }

  medirNivel() {
    repositoryBotijao
        .updateVol(new Botijao(ref: botijao.ref, volAtual: botijao.volAtual));
    repositoryHistoricoNivel.add(
        botijao.ref,
        new HistoricoNivel(
            respon: user.nome,
            qtdAtual: botijao.volAtual,
            data: Timestamp.now().toDate()));
  }

  @action
  updateCaneca(Caneca caneca) {
    repositoryCanecas.update(caneca);
  }
}
