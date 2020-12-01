import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

import '../../shared/models/farm.dart';
import '../../shared/repositories/interfaces/irepositoryfarm.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IRepositoryBotijao repository;
  final IRepositoryUserP repositoryUser;

  @observable
  List<Botijao> listBot;
  @observable
  ObservableStream<List<UserP>> user;

  _HomeControllerBase(this.repository, this.repositoryUser) {
    //getBot();
  }

  @action
  Future<List<Botijao>> getBot(String path) async {
    List<Botijao> t = [];
    print(path);
    await repository.list(path).then((value) => listBot = value);
    return t;
  }

  @action
  getUser(String email) {
    user = repositoryUser.list(email).asObservable();
  }
}
