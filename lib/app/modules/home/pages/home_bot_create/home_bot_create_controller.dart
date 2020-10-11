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
  getId(String id) => idBot = id;

  @action
  getVolTotal(String vol) => volTotal = double.parse(vol);

  @action
  getCanecas(String canecas) {
    numcanecas = int.parse(canecas);
    print(numcanecas);
  }

  @action
  addBot() {
    repository.add(
        new Botijao(idBot: idBot, numcanecas: numcanecas, volTotal: volTotal));
  }

  @action
  remove(String id) {
    repository.remove(id);
  }
}
