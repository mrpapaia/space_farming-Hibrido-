import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/shared/repositories/farmrepository.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';
import 'package:space_farming_modular/app/shared/repositories/userrepository.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';
import 'pages/cadastro/cadastro_controller.dart';
import 'pages/cadastro/cadastro_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => LoginController(userRepository: i.get(), user: null)),
      Bind((i) => CadastroController(i.get(), i.get())),
      Bind<IRepositoryFarm>(
        (i) => FarmRepository(FirebaseFirestore.instance),
      ),
      Bind<IRepositoryUserP>(
        (i) => UserPRepository(FirebaseFirestore.instance),
      ),
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter(
          "/login/cadastro",
          child: (_, args) => CadastroPage(),
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
