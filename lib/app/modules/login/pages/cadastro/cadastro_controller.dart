import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/models/farm.dart';
import '../../../../shared/models/user.dart';
import '../../../../shared/repositories/interfaces/irepositoryfarm.dart';
import '../../../../shared/repositories/interfaces/irepositoryuser.dart';

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

  Future<bool> singIn(FirebaseAuth auth) async {
    try {
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

        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
