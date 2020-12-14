import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';

part 'rack_add_controller.g.dart';

@Injectable()
class RackAddController = _RackAddControllerBase with _$RackAddController;

abstract class _RackAddControllerBase with Store {
  @observable
  Rack rack;

  @action
  void idToure(String value) {
    rack.idTouro = value;
  }

  @action
  void volume(String value) {
    rack.volume = value;
  }
}
