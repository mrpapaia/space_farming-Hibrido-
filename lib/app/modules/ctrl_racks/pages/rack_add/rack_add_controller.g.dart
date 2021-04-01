// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rack_add_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RackAddController on _RackAddControllerBase, Store {
  final _$ctrl1Atom = Atom(name: '_RackAddControllerBase.ctrl1');

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

  final _$ctrl2Atom = Atom(name: '_RackAddControllerBase.ctrl2');

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

  final _$ctrl3Atom = Atom(name: '_RackAddControllerBase.ctrl3');

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

  final _$editAtom = Atom(name: '_RackAddControllerBase.edit');

  @override
  bool get edit {
    _$editAtom.reportRead();
    return super.edit;
  }

  @override
  set edit(bool value) {
    _$editAtom.reportWrite(value, super.edit, () {
      super.edit = value;
    });
  }

  final _$_RackAddControllerBaseActionController =
      ActionController(name: '_RackAddControllerBase');

  @override
  void idToure(String value) {
    final _$actionInfo = _$_RackAddControllerBaseActionController.startAction(
        name: '_RackAddControllerBase.idToure');
    try {
      return super.idToure(value);
    } finally {
      _$_RackAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void doseUp(String value) {
    final _$actionInfo = _$_RackAddControllerBaseActionController.startAction(
        name: '_RackAddControllerBase.doseUp');
    try {
      return super.doseUp(value);
    } finally {
      _$_RackAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void volume(String value) {
    final _$actionInfo = _$_RackAddControllerBaseActionController.startAction(
        name: '_RackAddControllerBase.volume');
    try {
      return super.volume(value);
    } finally {
      _$_RackAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addRack(Rack rack) {
    final _$actionInfo = _$_RackAddControllerBaseActionController.startAction(
        name: '_RackAddControllerBase.addRack');
    try {
      return super.addRack(rack);
    } finally {
      _$_RackAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateRack(Rack rack) {
    final _$actionInfo = _$_RackAddControllerBaseActionController.startAction(
        name: '_RackAddControllerBase.updateRack');
    try {
      return super.updateRack(rack);
    } finally {
      _$_RackAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ctrl1: ${ctrl1},
ctrl2: ${ctrl2},
ctrl3: ${ctrl3},
edit: ${edit}
    ''';
  }
}
