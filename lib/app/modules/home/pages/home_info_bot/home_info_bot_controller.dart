import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

part 'home_info_bot_controller.g.dart';

@Injectable()
class HomeInfoBotController = _HomeInfoBotControllerBase
    with _$HomeInfoBotController;

abstract class _HomeInfoBotControllerBase with Store {
  final IRepositoryCanecas repository;

  @observable
  ObservableStream<List<Caneca>> listCanecas;

  _HomeInfoBotControllerBase(this.repository) {}
}
