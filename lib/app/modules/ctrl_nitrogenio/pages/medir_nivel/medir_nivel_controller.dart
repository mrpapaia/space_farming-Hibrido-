import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

part 'medir_nivel_controller.g.dart';

@Injectable()
class MedirNivelController = _MedirNivelControllerBase
    with _$MedirNivelController;

abstract class _MedirNivelControllerBase with Store {
  final IRepositoryHistoricoNivel repositoryHist;
  final IRepositoryBotijao repositoryBotijao;
  final txt = TextEditingController();
  final UserP user;
  final Botijao botijao;
  @observable
  double volAtual;
  @observable
  DateTime data = DateTime.now();
  _MedirNivelControllerBase(
    this.repositoryHist,
    this.repositoryBotijao,
    this.botijao,
    this.user,
  ) {
    txt.text = data.day.toString() +
        "/" +
        data.month.toString() +
        "/" +
        data.year.toString();
  }
  @action
  getVol(String vol) => volAtual = double.parse(vol);

  @action
  getData(String dat) => data = DateFormat('d/M/yyyy').parse(dat);
  @action
  update() {
    repositoryBotijao
        .updateVol(new Botijao(ref: botijao.ref, volAtual: volAtual));
    repositoryHist.add(botijao.ref,
        new HistoricoNivel(respon: user.nome, qtdAtual: volAtual, data: data));
  }
}
