import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

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

  _LoginControllerBase({this.userRepository, this.user});

  @action
  getUser(String email) {
    user = userRepository.list(email).asObservable();

    //farm = farmRepository.list(email).asObservable();
  }

  @action
  void getEmail(String email) {
    this.email = email;
  }

  @action
  void getPasswd(String passwd) {
    this.passwd = passwd;
  }

  @action
  String valideteEmail() {
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
  Future<UserCredential> login(FirebaseAuth auth, BuildContext ctx) async {
    UserCredential user;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(ctx));
    try {
      if (valideteEmail() == null) {
        if (validetePasswd() == null) {
          user = await auth.signInWithEmailAndPassword(
              email: this.email, password: this.passwd);
          if (user != null) {
            getUser(email);
            return user;
          }
        } else {
          Scaffold.of(ctx).showSnackBar(
            SnackBar(
              content: Text(validetePasswd()),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).size.height -
                      sizeConfig.dynamicScaleSize(
                          size: 75,
                          scaleFactorMini: 0.8,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1)),
            ),
          );
        }
      } else {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text(valideteEmail()),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).size.height -
                    sizeConfig.dynamicScaleSize(
                        size: 75,
                        scaleFactorMini: 0.8,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1)),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text("E-mail não cadastrado"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).size.height -
                    sizeConfig.dynamicScaleSize(
                        size: 75,
                        scaleFactorMini: 0.8,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1)),
          ),
        );
      } else if (e.code == 'wrong-password') {
        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text("Senha Incorreta"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).size.height -
                    sizeConfig.dynamicScaleSize(
                        size: 75,
                        scaleFactorMini: 0.8,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1)),
          ),
        );
      }
      return null;
    }
  }
}
