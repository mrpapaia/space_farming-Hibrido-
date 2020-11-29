import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/repositories/botijaorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/farmrepository.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';
import 'package:space_farming_modular/app/shared/repositories/userrepository.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => LoginController(i.get(), i.get())),
      Bind<IRepositoryFarm>((i) => FarmRepository(FirebaseFirestore.instance)),
      Bind<IRepositoryUserP>(
          (i) => UserPRepository(FirebaseFirestore.instance)),
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
