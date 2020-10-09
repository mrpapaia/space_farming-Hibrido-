import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'medir_nivel_controller.g.dart';

@Injectable()
class MedirNivelController = _MedirNivelControllerBase
    with _$MedirNivelController;

abstract class _MedirNivelControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
