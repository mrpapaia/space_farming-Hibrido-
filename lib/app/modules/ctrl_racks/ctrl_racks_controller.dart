import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

part 'ctrl_racks_controller.g.dart';

@Injectable()
class CtrlRacksController = _CtrlRacksControllerBase with _$CtrlRacksController;

abstract class _CtrlRacksControllerBase with Store {
  final IRepositoryRack repository;
  @observable
  ObservableStream<List<Rack>> listRack;
  _CtrlRacksControllerBase(
    this.repository,
  ) {
    getRacks();
  }

  @action
  getRacks() {
    listRack = repository.list().asObservable();
  }
}
