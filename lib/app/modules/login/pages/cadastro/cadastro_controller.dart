import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  final IRepositoryUserP repositoryUserP;
  final IRepositoryFarm repositoryFarm;
  @observable
  String email;
  @observable
  String passwd;
  @observable
  String nomeFazenda;
  @observable
  String nome;
  @observable
  String cpf;
  @observable
  String telefone;

  @observable
  String msg;

  _CadastroControllerBase(this.repositoryUserP, this.repositoryFarm);

  @action
  void getEmail(String email) => this.email = email;
  @action
  void getPasswd(String passwd) => this.passwd = passwd;
  @action
  void getFazenda(String nomeFazenda) => this.nomeFazenda = nomeFazenda;
  @action
  void getNome(String nome) => this.nome = nome;
  @action
  void getCpf(String cpf) => this.cpf = cpf;

  @action
  void getTelefone(String telefone) => this.telefone = telefone;

  @action
  bool verificar() {
    if (CPF.isValid(CPF.format(cpf)) || CNPJ.isValid(CNPJ.format(cpf))) {
      return true;
    } else {
      return false;
    }
  }

  teste(BuildContext context) {
    var sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("CPF/CNPJ invalido"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height -
                sizeConfig.dynamicScaleSize(
                    size: 75,
                    scaleFactorMini: 0.8,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1)),
      ),
    );
  }

  Future<bool> singIn(FirebaseAuth auth) async {
    try {
      if (CPF.isValid(CPF.format(cpf)) || CNPJ.isValid(CNPJ.format(cpf))) {
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: this.email, password: this.passwd);
        if (user != null) {
          repositoryFarm
              .add(new Farm(nome: this.nomeFazenda, email: this.email))
              .then((value) => repositoryUserP.add(new UserP(
                  nome: this.nome,
                  cpf: this.cpf,
                  email: this.email,
                  fazenda: {value: this.nomeFazenda},
                  tel: this.telefone)));
          this.msg = "Cadastrado com Sucesso";
          return true;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        this.msg = "A senha fornecida é muito fraca.";
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        this.msg = "A conta já existe para esse e-mail.";
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
