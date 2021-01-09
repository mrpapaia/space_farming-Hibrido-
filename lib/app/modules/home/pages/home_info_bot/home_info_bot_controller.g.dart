// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_info_bot_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeInfoBotController = BindInject(
  (i) => HomeInfoBotController(
      repositoryHistoricoNivel: i<IRepositoryHistoricoNivel>(),
      repositoryHistoricoAbastecimento: i<IRepositoryHistoricoAbastecimento>(),
      repositoryBotijao: i<IRepositoryBotijao>(),
      repositoryCanecas: i<IRepositoryCanecas>(),
      botijao: i<Botijao>(),
      user: i<UserP>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeInfoBotController on _HomeInfoBotControllerBase, Store {
  final _$_HomeInfoBotControllerBaseActionController =
      ActionController(name: '_HomeInfoBotControllerBase');

  @override
  dynamic getNivel(dynamic value) {
    final _$actionInfo = _$_HomeInfoBotControllerBaseActionController
        .startAction(name: '_HomeInfoBotControllerBase.getNivel');
    try {
      return super.getNivel(value);
    } finally {
      _$_HomeInfoBotControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCaneca(Caneca caneca) {
    final _$actionInfo = _$_HomeInfoBotControllerBaseActionController
        .startAction(name: '_HomeInfoBotControllerBase.updateCaneca');
    try {
      return super.updateCaneca(caneca);
    } finally {
      _$_HomeInfoBotControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
