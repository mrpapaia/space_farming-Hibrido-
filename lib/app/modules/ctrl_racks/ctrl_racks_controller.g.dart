// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctrl_racks_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CtrlRacksController = BindInject(
  (i) => CtrlRacksController(i<IRepositoryRack>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CtrlRacksController on _CtrlRacksControllerBase, Store {
  final _$listRackAtom = Atom(name: '_CtrlRacksControllerBase.listRack');

  @override
  ObservableStream<List<Rack>> get listRack {
    _$listRackAtom.reportRead();
    return super.listRack;
  }

  @override
  set listRack(ObservableStream<List<Rack>> value) {
    _$listRackAtom.reportWrite(value, super.listRack, () {
      super.listRack = value;
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
  String toString() {
    return '''
listRack: ${listRack}
    ''';
  }
}
