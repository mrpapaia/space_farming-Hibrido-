import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';

part 'home_info_bot_controller.g.dart';

@Injectable()
class HomeInfoBotController = _HomeInfoBotControllerBase
    with _$HomeInfoBotController;

abstract class _HomeInfoBotControllerBase with Store {
  final Botijao botijao;
  final UserP user;
  _HomeInfoBotControllerBase({this.botijao, this.user}) {}

  @action
  getNivel(value) {
    botijao.volAtual = value;
  }
}
