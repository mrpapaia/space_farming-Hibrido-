// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctrl_colaboradores_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CtrlColaboradoresController on _CtrlColaboradoresControllerBase, Store {
  final _$listColabAtom =
      Atom(name: '_CtrlColaboradoresControllerBase.listColab');

  @override
  ObservableStream<List<UserP>> get listColab {
    _$listColabAtom.reportRead();
    return super.listColab;
  }

  @override
  set listColab(ObservableStream<List<UserP>> value) {
    _$listColabAtom.reportWrite(value, super.listColab, () {
      super.listColab = value;
    });
  }

  final _$_CtrlColaboradoresControllerBaseActionController =
      ActionController(name: '_CtrlColaboradoresControllerBase');

  @override
  void getColab() {
    final _$actionInfo = _$_CtrlColaboradoresControllerBaseActionController
        .startAction(name: '_CtrlColaboradoresControllerBase.getColab');
    try {
      return super.getColab();
    } finally {
      _$_CtrlColaboradoresControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void remove(UserP user) {
    final _$actionInfo = _$_CtrlColaboradoresControllerBaseActionController
        .startAction(name: '_CtrlColaboradoresControllerBase.remove');
    try {
      return super.remove(user);
    } finally {
      _$_CtrlColaboradoresControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listColab: ${listColab}
    ''';
  }
}
