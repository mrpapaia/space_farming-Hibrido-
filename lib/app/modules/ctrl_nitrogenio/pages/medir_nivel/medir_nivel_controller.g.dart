// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medir_nivel_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MedirNivelController = BindInject(
  (i) => MedirNivelController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedirNivelController on _MedirNivelControllerBase, Store {
  final _$valueAtom = Atom(name: '_MedirNivelControllerBase.value');

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

  final _$_MedirNivelControllerBaseActionController =
      ActionController(name: '_MedirNivelControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MedirNivelControllerBaseActionController
        .startAction(name: '_MedirNivelControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MedirNivelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
