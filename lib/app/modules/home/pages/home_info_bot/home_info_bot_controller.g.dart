// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_info_bot_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeInfoBotController = BindInject(
  (i) => HomeInfoBotController(i<IRepositoryCanecas>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeInfoBotController on _HomeInfoBotControllerBase, Store {
  final _$listCanecasAtom =
      Atom(name: '_HomeInfoBotControllerBase.listCanecas');

  @override
  ObservableStream<List<Caneca>> get listCanecas {
    _$listCanecasAtom.reportRead();
    return super.listCanecas;
  }

  @override
  set listCanecas(ObservableStream<List<Caneca>> value) {
    _$listCanecasAtom.reportWrite(value, super.listCanecas, () {
      super.listCanecas = value;
    });
  }

  @override
  String toString() {
    return '''
listCanecas: ${listCanecas}
    ''';
  }
}
