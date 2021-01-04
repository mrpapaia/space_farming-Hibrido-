import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'ctrl_colaboradores_controller.g.dart';

@Injectable()
class CtrlColaboradoresController = _CtrlColaboradoresControllerBase
    with _$CtrlColaboradoresController;

abstract class _CtrlColaboradoresControllerBase with Store {
  final IRepositoryUserP repositoryUserP;
  final String key;
  final String value;

  @observable
  ObservableStream<List<UserP>> listColab;

  _CtrlColaboradoresControllerBase(this.repositoryUserP, this.key, this.value) {
    getColab();
  }

  @action
  void getColab() {
    listColab = repositoryUserP.listColab(this.key, this.value).asObservable();
  }
}
