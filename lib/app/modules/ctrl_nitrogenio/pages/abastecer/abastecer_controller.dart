import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';

part 'abastecer_controller.g.dart';

@Injectable()
class AbastecerController = _AbastecerControllerBase with _$AbastecerController;

abstract class _AbastecerControllerBase with Store {
  final IRepositoryHistoricoAbastecimento repositoryHist;
  final IRepositoryBotijao repositoryBotijao;
  final txt = TextEditingController();

  final Botijao botijao;
  final UserP user;
  @observable
  double volAtual;

  @observable
  double preco;

  @observable
  DateTime data = DateTime.now();

  _AbastecerControllerBase(
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
  getData(String data) => data = this.data.toString();

  @action
  getPreco(String preco) => this.preco = double.parse(preco);
  @action
  update() {
    repositoryBotijao.updateVol(
        new Botijao(ref: botijao.ref, volAtual: botijao.volAtual + volAtual));
    repositoryHist.add(
        botijao.ref,
        new HistoricoAbastecimento(
            respon: user.nome,
            qtdAtual: botijao.volAtual,
            qtdAdd: volAtual,
            data: data,
            preco: preco));
  }
}
