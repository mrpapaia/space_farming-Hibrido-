import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

part 'rack_add_controller.g.dart';

@Injectable()
class RackAddController = _RackAddControllerBase with _$RackAddController;

abstract class _RackAddControllerBase with Store {
  Rack rack;
  final IRepositoryRack repository;
  @observable
  var ctrl1 = TextEditingController();
  @observable
  var ctrl2 = TextEditingController();
  @observable
  var ctrl3 = TextEditingController();
  @observable
  bool edit = false;
  _RackAddControllerBase(this.repository, this.rack) {
    if (this.rack.idTouro != null) {
      edit = true;
      ctrl1.text = this.rack.idTouro;
      ctrl2.text = this.rack.doseUp.toString();
      ctrl3.text = this.rack.doseDown.toString();
    } else {
      edit = false;
    }
  }

  @action
  void idToure(String value) {
    rack.idTouro = value;
  }

  @action
  void doseUp(String value) {
    rack.doseUp = value;
  }

  void doseDown(String value) {
    rack.doseDown = value;
  }

  @action
  void volume(String value) {
    rack.volume = value;
  }

  @action
  addRack(Rack rack) {
    repository.add(rack);
  }

  @action
  updateRack(Rack rack) {
    repository.update(rack);
  }
}
