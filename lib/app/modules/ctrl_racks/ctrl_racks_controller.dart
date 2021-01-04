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
  @observable
  ObservableStream<List<Rack>> listRacks;
  final Caneca caneca;
  final UserP user;
  @observable
  ObservableStream<List<Rack>> listRack;
  _CtrlRacksControllerBase(this.repository, this.caneca, this.user) {
    getRacks();
  }

  @action
  getRacks() {
    this.listRacks = repository.list(this.caneca.id).asObservable();
  }

  @action
  remove(Rack rack) {
    repository.remove(rack.ref.path);
  }

  @action
  addRack(Rack rack) {
    repository.add(rack);
  }
}
