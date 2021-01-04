// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_add_farm_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeAddFarmController = BindInject(
  (i) => HomeAddFarmController(
      i<IRepositoryFarm>(), i<IRepositoryUserP>(), i<UserP>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeAddFarmController on _HomeAddFarmControllerBase, Store {
  final _$nomeFazendaAtom =
      Atom(name: '_HomeAddFarmControllerBase.nomeFazenda');

  @override
  String get nomeFazenda {
    _$nomeFazendaAtom.reportRead();
    return super.nomeFazenda;
  }

  @override
  set nomeFazenda(String value) {
    _$nomeFazendaAtom.reportWrite(value, super.nomeFazenda, () {
      super.nomeFazenda = value;
    });
  }

  final _$_HomeAddFarmControllerBaseActionController =
      ActionController(name: '_HomeAddFarmControllerBase');

  @override
  dynamic getNomeFazenda(String value) {
    final _$actionInfo = _$_HomeAddFarmControllerBaseActionController
        .startAction(name: '_HomeAddFarmControllerBase.getNomeFazenda');
    try {
      return super.getNomeFazenda(value);
    } finally {
      _$_HomeAddFarmControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFarm() {
    final _$actionInfo = _$_HomeAddFarmControllerBaseActionController
        .startAction(name: '_HomeAddFarmControllerBase.addFarm');
    try {
      return super.addFarm();
    } finally {
      _$_HomeAddFarmControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeFazenda: ${nomeFazenda}
    ''';
  }
}
