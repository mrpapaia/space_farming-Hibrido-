import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

part 'ctrl_racks_controller.g.dart';

@Injectable()
class CtrlRacksController = _CtrlRacksControllerBase with _$CtrlRacksController;

abstract class _CtrlRacksControllerBase with Store {
  final IRepositoryRack repository;

  final Caneca caneca;
  final UserP user;
  List<Rack> listRacks;
  @observable
  // ObservableStream<List<Rack>> listRacks;
  _CtrlRacksControllerBase(this.repository, this.caneca, this.user) {
    listRacks = caneca.racks;
    //getRacks();
  }

  @action
  getRacks() {
    //this.listRacks = repository.list(this.caneca.id).asObservable();
  }

  @action
  remove(Rack rack) {
    repository.remove(rack.ref.path);
    caneca.racks.remove(rack);
  }

  @action
  addRack(Rack rack) {
    caneca.racks.add(rack);
    repository.add(rack);
  }
}
