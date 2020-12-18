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
  @observable
  String idBot;

  @observable
  double volTotal;

  @observable
  int numcanecas = 1;

  _HomeBotCreateControllerBase(this.repository);

  @action
  getId(String id) {
    print(id);
    idBot = id;
  }

  @action
  getVolTotal(String vol) => volTotal = double.parse(vol);

  @action
  getCanecas(String canecas) {
    numcanecas = int.parse(canecas);
    print(numcanecas);
  }

  @action
  addBot(String path) {
    repository.add(
        path,
        new Botijao(
          idBot: idBot,
          numcanecas: numcanecas,
          volTotal: volTotal,
          volAtual: 0,
          qtdDose: 0,
        ));
  }

  @action
  remove(String id) {
    repository.remove(id);
  }
}
