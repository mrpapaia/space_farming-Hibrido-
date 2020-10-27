import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'rack_info_controller.g.dart';

@Injectable()
class RackInfoController = _RackInfoControllerBase with _$RackInfoController;

abstract class _RackInfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
