import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

part 'home_bot_create_controller.g.dart';

@Injectable()
class HomeBotCreateController = _HomeBotCreateControllerBase
    with _$HomeBotCreateController;

abstract class _HomeBotCreateControllerBase with Store {
  final IRepositoryBotijao repository;
  final Botijao botijao;
  final String path;

  @observable
  var ctrl1 = TextEditingController();
  @observable
  var ctrl2 = TextEditingController();
  @observable
  var ctrl3 = TextEditingController();

  @observable
  bool edit = false;
  _HomeBotCreateControllerBase({this.repository, this.path, this.botijao}) {
    if (botijao.idBot != null) {
      edit = true;
      ctrl1.text = botijao.idBot;
      ctrl2.text = botijao.volTotal.toString();
      ctrl3.text = botijao.volAtual.toString();
    } else {
      edit = false;
    }
  }

  @action
  getId(String id) {
    botijao.idBot = id;
    ctrl1.value = TextEditingValue(
      text: id,
      selection: TextSelection.collapsed(offset: id.length),
    );
  }

  @action
  getVolTotal(String vol) {
    botijao.volTotal = double.parse(vol);
    ctrl2.value = TextEditingValue(
      text: vol,
      selection: TextSelection.collapsed(offset: vol.length),
    );
  }

  @action
  getVolAtual(String vol) {
    botijao.volAtual = double.parse(vol);
    ctrl3.value = TextEditingValue(
      text: vol,
      selection: TextSelection.collapsed(offset: vol.length),
    );
  }

  @action
  getCanecas(String canecas) {
    botijao.numcanecas = int.parse(canecas);
  }

  @action
  getDoses(String dose) {
    botijao.qtdDose = int.parse(dose);
  }

  @action
  updateBot() {
    repository.updateBot(botijao);
  }

  @action
  addBot() {
    repository.add(path, botijao).then((value) => print("sucesso!"));
  }

  @action
  remove(String id) {
    repository.remove(id);
  }
}
