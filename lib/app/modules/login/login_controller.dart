import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IRepositoryUserP userRepository;

  @observable
  ObservableStream<List<UserP>> user;

  @observable
  String email;

  @observable
  String passwd;

  _LoginControllerBase(this.userRepository);

  @action
  getUser(String email) {
    user = userRepository.list(email).asObservable();

    //farm = farmRepository.list(email).asObservable();
  }

  @action
  void getEmail(String email) {
    print(email);
    this.email = email;
  }

  @action
  void getPasswd(String passwd) {
    this.passwd = passwd;
    print(this.passwd);
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
  Future<UserCredential> login(FirebaseAuth auth) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: this.email, password: this.passwd);
      if (user != null) {
        getUser(email);

        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
