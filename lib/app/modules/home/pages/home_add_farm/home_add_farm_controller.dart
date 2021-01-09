import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'home_add_farm_controller.g.dart';

@Injectable()
class HomeAddFarmController = _HomeAddFarmControllerBase
    with _$HomeAddFarmController;

abstract class _HomeAddFarmControllerBase with Store {
  final IRepositoryFarm repositoryFarm;
  final IRepositoryUserP repositoryUser;
  final UserP userP;
  @observable
  String nomeFazenda;

  _HomeAddFarmControllerBase(
      this.repositoryFarm, this.repositoryUser, this.userP);

  @action
  getNomeFazenda(String value) {
    this.nomeFazenda = value;
  }

  @action
  void addFarm() {
    UserP newUser = this.userP;
    repositoryFarm
        .add(new Farm(nome: this.nomeFazenda, email: this.userP.email))
        .then((value) {
      newUser.fazenda.putIfAbsent(value, () => this.nomeFazenda);
      repositoryUser.update(newUser);
    });
  }
}
