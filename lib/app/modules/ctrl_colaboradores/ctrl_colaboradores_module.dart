import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';
import 'package:space_farming_modular/app/shared/repositories/userrepository.dart';

import 'ctrl_colaboradores_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ctrl_colaboradores_page.dart';

class CtrlColaboradoresModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CtrlColaboradoresController(
            i.get(),
            i.args.data[0],
            i.args.data[1],
          ),
        ),
        Bind<IRepositoryUserP>(
          (i) => UserPRepository(FirebaseFirestore.instance),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => CtrlColaboradoresPage(),
        ),
      ];

  static Inject get to => Inject<CtrlColaboradoresModule>.of();
}
