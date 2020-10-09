// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bot_create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeBotCreateController = BindInject(
  (i) => HomeBotCreateController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeBotCreateController on _HomeBotCreateControllerBase, Store {
  final _$valueAtom = Atom(name: '_HomeBotCreateControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_HomeBotCreateControllerBaseActionController =
      ActionController(name: '_HomeBotCreateControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomeBotCreateControllerBaseActionController
        .startAction(name: '_HomeBotCreateControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeBotCreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
