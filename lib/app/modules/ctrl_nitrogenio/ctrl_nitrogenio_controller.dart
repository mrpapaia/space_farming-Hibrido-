import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'ctrl_nitrogenio_controller.g.dart';

@Injectable()
class CtrlNitrogenioController = _CtrlNitrogenioControllerBase
    with _$CtrlNitrogenioController;

abstract class _CtrlNitrogenioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
