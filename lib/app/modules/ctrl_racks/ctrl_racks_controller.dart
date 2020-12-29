import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

part 'ctrl_racks_controller.g.dart';

@Injectable()
class CtrlRacksController = _CtrlRacksControllerBase with _$CtrlRacksController;

abstract class _CtrlRacksControllerBase with Store {
  final IRepositoryRack repository;
  final List<Rack> listRacks;
  final UserP user;
  @observable
  ObservableStream<List<Rack>> listRack;
  _CtrlRacksControllerBase(this.repository, this.listRacks, this.user) {
    // getRacks();
  }

  @action
  remove(Rack rack) {
    repository.remove(rack.ref.path);
  }
}
