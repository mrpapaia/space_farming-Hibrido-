import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'abastecer_controller.g.dart';

@Injectable()
class AbastecerController = _AbastecerControllerBase with _$AbastecerController;

abstract class _AbastecerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
