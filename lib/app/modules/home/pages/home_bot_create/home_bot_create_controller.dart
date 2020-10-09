import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_bot_create_controller.g.dart';

@Injectable()
class HomeBotCreateController = _HomeBotCreateControllerBase
    with _$HomeBotCreateController;

abstract class _HomeBotCreateControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
