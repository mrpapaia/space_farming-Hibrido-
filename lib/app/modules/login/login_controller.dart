import 'dart:wasm';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IRepositoryFarm farmRepository;
  final IRepositoryUserP userRepository;

  @observable
  ObservableStream<List<Farm>> farm;

  @observable
  ObservableStream<List<UserP>> user;

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
  isSuccefull(DocumentReference doc, UserP user) {
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

  @action
  Future<bool> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: this.email, password: this.passwd);
      if (userCredential.user != null) {
        getUser(email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
