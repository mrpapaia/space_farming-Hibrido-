import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, Disposable {
  final IRepositoryBotijao botijaoRepository;

  @observable
  ObservableStream<List<Farm>> listFarm;

  @observable
  ObservableStream<List<Botijao>> listBot;

  _HomeControllerBase(this.botijaoRepository);
  @action
  getList(String farmName) {
    listFarm = botijaoRepository.lista(farmName).asObservable();
  }

  @action
  getBot(DocumentReference ref) {
    listBot = botijaoRepository.list(ref).asObservable();
  }

  @override
  void dispose() {}
}
