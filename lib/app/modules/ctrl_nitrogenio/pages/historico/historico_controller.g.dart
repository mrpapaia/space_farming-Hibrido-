// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HistoricoController = BindInject(
  (i) => HistoricoController(
      i<IRepositoryHistoricoNivel>(), i<IRepositoryHistoricoAbastecimento>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricoController on _HistoricoControllerBase, Store {
  final _$listHistNivelAtom =
      Atom(name: '_HistoricoControllerBase.listHistNivel');

  @override
  ObservableStream<List<HistoricoNivel>> get listHistNivel {
    _$listHistNivelAtom.reportRead();
    return super.listHistNivel;
  }

  @override
  set listHistNivel(ObservableStream<List<HistoricoNivel>> value) {
    _$listHistNivelAtom.reportWrite(value, super.listHistNivel, () {
      super.listHistNivel = value;
    });
  }

  final _$listHistAbastecimentoAtom =
      Atom(name: '_HistoricoControllerBase.listHistAbastecimento');

  @override
  ObservableStream<List<HistoricoAbastecimento>> get listHistAbastecimento {
    _$listHistAbastecimentoAtom.reportRead();
    return super.listHistAbastecimento;
  }

  @override
  set listHistAbastecimento(
      ObservableStream<List<HistoricoAbastecimento>> value) {
    _$listHistAbastecimentoAtom.reportWrite(value, super.listHistAbastecimento,
        () {
      super.listHistAbastecimento = value;
    });
  }

  final _$_HistoricoControllerBaseActionController =
      ActionController(name: '_HistoricoControllerBase');

  @override
  dynamic getHistoricoNivel() {
    final _$actionInfo = _$_HistoricoControllerBaseActionController.startAction(
        name: '_HistoricoControllerBase.getHistoricoNivel');
    try {
      return super.getHistoricoNivel();
    } finally {
      _$_HistoricoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getHistoricoAbastecimento() {
    final _$actionInfo = _$_HistoricoControllerBaseActionController.startAction(
        name: '_HistoricoControllerBase.getHistoricoAbastecimento');
    try {
      return super.getHistoricoAbastecimento();
    } finally {
      _$_HistoricoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listHistNivel: ${listHistNivel},
listHistAbastecimento: ${listHistAbastecimento}
    ''';
  }
}
