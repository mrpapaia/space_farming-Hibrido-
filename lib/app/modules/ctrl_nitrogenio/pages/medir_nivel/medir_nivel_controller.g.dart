// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medir_nivel_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MedirNivelController = BindInject(
  (i) => MedirNivelController(
      i<IRepositoryHistoricoNivel>(), i<IRepositoryBotijao>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedirNivelController on _MedirNivelControllerBase, Store {
  final _$volAtualAtom = Atom(name: '_MedirNivelControllerBase.volAtual');

  @override
  double get volAtual {
    _$volAtualAtom.reportRead();
    return super.volAtual;
  }

  @override
  set volAtual(double value) {
    _$volAtualAtom.reportWrite(value, super.volAtual, () {
      super.volAtual = value;
    });
  }

  final _$dataAtom = Atom(name: '_MedirNivelControllerBase.data');

  @override
  DateTime get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$_MedirNivelControllerBaseActionController =
      ActionController(name: '_MedirNivelControllerBase');

  @override
  dynamic getVol(String vol) {
    final _$actionInfo = _$_MedirNivelControllerBaseActionController
        .startAction(name: '_MedirNivelControllerBase.getVol');
    try {
      return super.getVol(vol);
    } finally {
      _$_MedirNivelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData(String data) {
    final _$actionInfo = _$_MedirNivelControllerBaseActionController
        .startAction(name: '_MedirNivelControllerBase.getData');
    try {
      return super.getData(data);
    } finally {
      _$_MedirNivelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(String id, UserP user) {
    final _$actionInfo = _$_MedirNivelControllerBaseActionController
        .startAction(name: '_MedirNivelControllerBase.update');
    try {
      return super.update(id, user);
    } finally {
      _$_MedirNivelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
volAtual: ${volAtual},
data: ${data}
    ''';
  }
}
