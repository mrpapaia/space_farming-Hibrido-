import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, Disposable {
  final IRepositoryBotijao repository;

  @observable
  ObservableStream<List<Botijao>> listBot;

  _HomeControllerBase(this.repository) {
    getBot();
  }

  @action
  getBot() {
    listBot = repository.list().asObservable();
  }

  @override
  void dispose() {}
}
