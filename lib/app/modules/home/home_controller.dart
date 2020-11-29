import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IRepositoryBotijao repository;
  final IRepositoryCanecas repositoryCanecas;

  @observable
 ObservableStream< List<Botijao>> listBot;

  ObservableStream<List<Caneca>> listCaneca;

  _HomeControllerBase(this.repository, this.repositoryCanecas) {
    getBot();
  }

  @action
  getBot() {
   listBot= repository.list().asObservable();
  }

  @action
  getCaneca(DocumentReference doc) {
    return repositoryCanecas.list(doc).asObservable();
  }
}
