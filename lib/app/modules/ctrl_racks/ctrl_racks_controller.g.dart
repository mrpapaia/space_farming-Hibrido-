// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctrl_racks_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CtrlRacksController on _CtrlRacksControllerBase, Store {
  final _$listRacksAtom = Atom(name: '_CtrlRacksControllerBase.listRacks');

  @override
  ObservableStream<List<Rack>> get listRacks {
    _$listRacksAtom.reportRead();
    return super.listRacks;
  }

  @override
  set listRacks(ObservableStream<List<Rack>> value) {
    _$listRacksAtom.reportWrite(value, super.listRacks, () {
      super.listRacks = value;
    });
  }

  final _$_CtrlRacksControllerBaseActionController =
      ActionController(name: '_CtrlRacksControllerBase');

  @override
  dynamic getRacks() {
    final _$actionInfo = _$_CtrlRacksControllerBaseActionController.startAction(
        name: '_CtrlRacksControllerBase.getRacks');
    try {
      return super.getRacks();
    } finally {
      _$_CtrlRacksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic remove(Rack rack) {
    final _$actionInfo = _$_CtrlRacksControllerBaseActionController.startAction(
        name: '_CtrlRacksControllerBase.remove');
    try {
      return super.remove(rack);
    } finally {
      _$_CtrlRacksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addRack(Rack rack) {
    final _$actionInfo = _$_CtrlRacksControllerBaseActionController.startAction(
        name: '_CtrlRacksControllerBase.addRack');
    try {
      return super.addRack(rack);
    } finally {
      _$_CtrlRacksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listRacks: ${listRacks}
    ''';
  }
}
