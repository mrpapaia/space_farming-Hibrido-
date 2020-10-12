import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  @observable
  String email;

  @observable
  String passwd;

  _LoginControllerBase(this.farmRepository, this.userRepository);

  @action
  getUser(String email) {
    user = userRepository.list(email).asObservable();
    farm = farmRepository.list(email).asObservable();
  }

  @action
  isSuccefull(DocumentReference doc, User user) {
    Modular.to.pushNamed('/home', arguments: [doc, user]);
  }

  @action
  void getEmail(String email) {
    this.email = email;
  }

  @action
  void getPasswd(String passwd) {
    this.passwd = passwd;
    //print(this.email);
  }

  @action
  String valideteEmail(String email) {
    if (email == null || email.isEmpty) {
      return "E-mail é um campo obrigatorio";
    } else if (!email.contains("@") && !email.contains(".com")) {
      return "E-mail invalido";
    } else {
      return null;
    }
  }

  @action
  String validetePasswd() {
    if (this.passwd == null || this.passwd.isEmpty) {
      return "Senha é um campo obrigatorio";
    } else {
      return null;
    }
  }
}
