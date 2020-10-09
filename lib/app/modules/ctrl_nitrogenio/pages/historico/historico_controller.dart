import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'historico_controller.g.dart';

@Injectable()
class HistoricoController = _HistoricoControllerBase with _$HistoricoController;

abstract class _HistoricoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
