import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/abastecer/abastecer_page.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/historico_page.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/medir_nivel/medir_nivel_page.dart';

import 'pages/historico/historico_controller.dart';
import 'pages/abastecer/abastecer_controller.dart';
import 'pages/medir_nivel/medir_nivel_controller.dart';
import 'ctrl_nitrogenio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ctrl_nitrogenio_page.dart';

class CtrlNitrogenioModule extends ChildModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => MedirNivelController()),
      Bind((i) => AbastecerController()),
      Bind((i) => HistoricoController()),
      $CtrlNitrogenioController,
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CtrlNitrogenioPage(
                  botijao: args.data,
                )),
        ModularRouter("/medirNivel", child: (_, args) => MedirNivelPage()),
        ModularRouter("/abastecer", child: (_, args) => AbastecerPage()),
        ModularRouter("/historico", child: (_, args) => HistoricoPage()),
      ];

  static Inject get to => Inject<CtrlNitrogenioModule>.of();
}
