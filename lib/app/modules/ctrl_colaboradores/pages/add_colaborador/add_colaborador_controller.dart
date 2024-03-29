import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'add_colaborador_controller.g.dart';

@Injectable()
class AddColaboradorController = _AddColaboradorControllerBase
    with _$AddColaboradorController;

abstract class _AddColaboradorControllerBase with Store {
  final IRepositoryUserP repositoryUserP;
  final String key;
  final String value;
  String email;
  _AddColaboradorControllerBase(this.repositoryUserP, this.key, this.value);
  @action
  getEmail(String value) {
    email = value;
    print(email);
  }

  @action
  void setColab() {
    repositoryUserP.updateC(email, key, value);
  }
}
