import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/repositories/botijaorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/histabastecimentorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/histnivelrepository.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

import 'relatorio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'relatorio_page.dart';

class RelatorioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RelatorioController(i.get(), i.get(), i.args.data[0])),
        Bind<IRepositoryBotijao>(
            (i) => BotijaoRepository(FirebaseFirestore.instance)),
        Bind<IRepositoryHistoricoNivel>(
          (i) => HistoricoNivelRepository(FirebaseFirestore.instance),
        ),
        Bind<IRepositoryHistoricoAbastecimento>(
          (i) => HistoricoAbastecimentoRepository(FirebaseFirestore.instance),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RelatorioPage()),
      ];

  static Inject get to => Inject<RelatorioModule>.of();
}
