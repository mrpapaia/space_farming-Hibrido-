import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_add_farm_controller.g.dart';

@Injectable()
class HomeAddFarmController = _HomeAddFarmControllerBase
    with _$HomeAddFarmController;

abstract class _HomeAddFarmControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
