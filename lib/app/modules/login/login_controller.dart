import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IRepositoryFarm farmRepository;
  final IRepositoryUser userRepository;
  @observable
  ObservableStream<List<Farm>> farm;
  @observable
  ObservableStream<List<User>> user;
  _LoginControllerBase(this.farmRepository, this.userRepository);

  @action
  getUser(String email) {
    user = userRepository.list(email).asObservable();
    return farm = farmRepository.list(email).asObservable();
  }

  @action
  isSuccefull(DocumentReference doc) {
    Modular.to.pushNamed('/home', arguments: doc);
  }
}
