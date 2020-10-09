// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IRepositoryBotijao>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listFarmAtom = Atom(name: '_HomeControllerBase.listFarm');

  @override
  ObservableStream<List<Farm>> get listFarm {
    _$listFarmAtom.reportRead();
    return super.listFarm;
  }

  @override
  set listFarm(ObservableStream<List<Farm>> value) {
    _$listFarmAtom.reportWrite(value, super.listFarm, () {
      super.listFarm = value;
    });
  }

  final _$listBotAtom = Atom(name: '_HomeControllerBase.listBot');

  @override
  ObservableStream<List<Botijao>> get listBot {
    _$listBotAtom.reportRead();
    return super.listBot;
  }

  @override
  set listBot(ObservableStream<List<Botijao>> value) {
    _$listBotAtom.reportWrite(value, super.listBot, () {
      super.listBot = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic getList(String farmName) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getList');
    try {
      return super.getList(farmName);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getBot(DocumentReference ref) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getBot');
    try {
      return super.getBot(ref);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFarm: ${listFarm},
listBot: ${listBot}
    ''';
  }
}
