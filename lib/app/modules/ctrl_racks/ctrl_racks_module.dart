import 'pages/rack_info/rack_info_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';
import 'package:space_farming_modular/app/shared/repositories/rackrepository.dart';

import 'ctrl_racks_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ctrl_racks_page.dart';

class CtrlRacksModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RackInfoController,
        Bind((i) => CtrlRacksController(i.get())),
        Bind<IRepositoryRack>((i) =>
            RackRepository(FirebaseFirestore.instance, i.args.data[0].id)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) =>
                CtrlRacksPage(listRacks: args.data[0].racks, user: args.data[1])),
      ];

  static Inject get to => Inject<CtrlRacksModule>.of();
}
