// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatorioController on _RelatorioControllerBase, Store {
  final _$listHistNivelAtom =
      Atom(name: '_RelatorioControllerBase.listHistNivel');

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
      Atom(name: '_RelatorioControllerBase.listHistAbastecimento');

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

  final _$listSpotAtom = Atom(name: '_RelatorioControllerBase.listSpot');

  @override
  List<FlSpot> get listSpot {
    _$listSpotAtom.reportRead();
    return super.listSpot;
  }

  @override
  set listSpot(List<FlSpot> value) {
    _$listSpotAtom.reportWrite(value, super.listSpot, () {
      super.listSpot = value;
    });
  }

  final _$_RelatorioControllerBaseActionController =
      ActionController(name: '_RelatorioControllerBase');

  @override
  dynamic getHistoricoNivel() {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getHistoricoNivel');
    try {
      return super.getHistoricoNivel();
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getHistoricoAbastecimento() {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getHistoricoAbastecimento');
    try {
      return super.getHistoricoAbastecimento();
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAllSpots() {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getAllSpots');
    try {
      return super.getAllSpots();
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getSpotsLast({int time = 15}) {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getSpotsLast');
    try {
      return super.getSpotsLast(time: time);
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getSpotsMonth(int mes) {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getSpotsMonth');
    try {
      return super.getSpotsMonth(mes);
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listHistNivel: ${listHistNivel},
listHistAbastecimento: ${listHistAbastecimento},
listSpot: ${listSpot}
    ''';
  }
}
