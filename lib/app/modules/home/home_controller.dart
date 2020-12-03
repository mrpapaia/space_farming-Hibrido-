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

  final UserP user;

  @observable
  ObservableStream<List<Botijao>> listBot;

  _HomeControllerBase(this.repository, this.user) {
    getBot(user.fazenda[0]);
  }

  @action
  getBot(String path) {
    listBot = repository.list(path).asObservable();
  }
}
