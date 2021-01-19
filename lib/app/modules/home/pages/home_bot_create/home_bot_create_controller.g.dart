// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bot_create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeBotCreateController = BindInject(
  (i) => HomeBotCreateController(
      repository: i<IRepositoryBotijao>(),
      path: i<String>(),
      botijao: i<Botijao>(),
      edit: i<bool>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeBotCreateController on _HomeBotCreateControllerBase, Store {
  final _$ctrl1Atom = Atom(name: '_HomeBotCreateControllerBase.ctrl1');

  @override
  TextEditingController get ctrl1 {
    _$ctrl1Atom.reportRead();
    return super.ctrl1;
  }

  @override
  set ctrl1(TextEditingController value) {
    _$ctrl1Atom.reportWrite(value, super.ctrl1, () {
      super.ctrl1 = value;
    });
  }

  final _$ctrl2Atom = Atom(name: '_HomeBotCreateControllerBase.ctrl2');

  @override
  TextEditingController get ctrl2 {
    _$ctrl2Atom.reportRead();
    return super.ctrl2;
  }

  @override
  set ctrl2(TextEditingController value) {
    _$ctrl2Atom.reportWrite(value, super.ctrl2, () {
      super.ctrl2 = value;
    });
  }

  final _$ctrl3Atom = Atom(name: '_HomeBotCreateControllerBase.ctrl3');

  @override
  TextEditingController get ctrl3 {
    _$ctrl3Atom.reportRead();
    return super.ctrl3;
  }

  @override
  set ctrl3(TextEditingController value) {
    _$ctrl3Atom.reportWrite(value, super.ctrl3, () {
      super.ctrl3 = value;
    });
  }

  final _$ctrl4Atom = Atom(name: '_HomeBotCreateControllerBase.ctrl4');

  @override
  TextEditingController get ctrl4 {
    _$ctrl4Atom.reportRead();
    return super.ctrl4;
  }

  @override
  set ctrl4(TextEditingController value) {
    _$ctrl4Atom.reportWrite(value, super.ctrl4, () {
      super.ctrl4 = value;
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
  dynamic getVolAtual(String vol) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.getVolAtual');
    try {
      return super.getVolAtual(vol);
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
  dynamic getDoses(String dose) {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.getDoses');
    try {
      return super.getDoses(dose);
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateBot() {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.updateBot');
    try {
      return super.updateBot();
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool addBot() {
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
ctrl1: ${ctrl1},
ctrl2: ${ctrl2},
ctrl3: ${ctrl3},
ctrl4: ${ctrl4}
    ''';
  }
}
