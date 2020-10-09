import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';

part 'home_info_bot_controller.g.dart';

@Injectable()
class HomeInfoBotController = _HomeInfoBotControllerBase
    with _$HomeInfoBotController;

abstract class _HomeInfoBotControllerBase with Store {
  final IRepositoryCanecas canecas;
  @observable
  ObservableStream<List<Caneca>> listCanecas;

  _HomeInfoBotControllerBase(this.canecas);

  @action
  getCanecas(DocumentReference doc) {
    listCanecas = canecas.list(doc).asObservable();
  }
}
