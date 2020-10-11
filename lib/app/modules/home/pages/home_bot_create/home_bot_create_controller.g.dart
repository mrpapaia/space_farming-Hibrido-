// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bot_create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeBotCreateController = BindInject(
  (i) => HomeBotCreateController(i<IRepositoryBotijao>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeBotCreateController on _HomeBotCreateControllerBase, Store {
  final _$idBotAtom = Atom(name: '_HomeBotCreateControllerBase.idBot');

  @override
  String get idBot {
    _$idBotAtom.reportRead();
    return super.idBot;
  }

  @override
  set idBot(String value) {
    _$idBotAtom.reportWrite(value, super.idBot, () {
      super.idBot = value;
    });
  }

  final _$volTotalAtom = Atom(name: '_HomeBotCreateControllerBase.volTotal');

  @override
  double get volTotal {
    _$volTotalAtom.reportRead();
    return super.volTotal;
  }

  @override
  set volTotal(double value) {
    _$volTotalAtom.reportWrite(value, super.volTotal, () {
      super.volTotal = value;
    });
  }

  final _$numcanecasAtom =
      Atom(name: '_HomeBotCreateControllerBase.numcanecas');

  @override
  int get numcanecas {
    _$numcanecasAtom.reportRead();
    return super.numcanecas;
  }

  @override
  set numcanecas(int value) {
    _$numcanecasAtom.reportWrite(value, super.numcanecas, () {
      super.numcanecas = value;
    });
  }

  final _$_HomeBotCreateControllerBaseActionController =
      ActionController(name: '_HomeBotCreateControllerBase');

  @override
  dynamic getId(String id) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.getId');
    try {
      return super.getId(id);
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getVolTotal(String vol) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.getVolTotal');
    try {
      return super.getVolTotal(vol);
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCanecas(String canecas) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.getCanecas');
    try {
      return super.getCanecas(canecas);
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addBot() {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.addBot');
    try {
      return super.addBot();
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic remove(String id) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.remove');
    try {
      return super.remove(id);
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idBot: ${idBot},
volTotal: ${volTotal},
numcanecas: ${numcanecas}
    ''';
  }
}
