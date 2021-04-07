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

  final _$listSpotsDaysAtom =
      Atom(name: '_RelatorioControllerBase.listSpotsDays');

  @override
  List<FlSpot> get listSpotsDays {
    _$listSpotsDaysAtom.reportRead();
    return super.listSpotsDays;
  }

  @override
  set listSpotsDays(List<FlSpot> value) {
    _$listSpotsDaysAtom.reportWrite(value, super.listSpotsDays, () {
      super.listSpotsDays = value;
    });
  }

  final _$listSpotsWeekAtom =
      Atom(name: '_RelatorioControllerBase.listSpotsWeek');

  @override
  List<FlSpot> get listSpotsWeek {
    _$listSpotsWeekAtom.reportRead();
    return super.listSpotsWeek;
  }

  @override
  set listSpotsWeek(List<FlSpot> value) {
    _$listSpotsWeekAtom.reportWrite(value, super.listSpotsWeek, () {
      super.listSpotsWeek = value;
    });
  }

  final _$listSpotsMonthAtom =
      Atom(name: '_RelatorioControllerBase.listSpotsMonth');

  @override
  List<FlSpot> get listSpotsMonth {
    _$listSpotsMonthAtom.reportRead();
    return super.listSpotsMonth;
  }

  @override
  set listSpotsMonth(List<FlSpot> value) {
    _$listSpotsMonthAtom.reportWrite(value, super.listSpotsMonth, () {
      super.listSpotsMonth = value;
    });
  }

  final _$nomesDaysAtom = Atom(name: '_RelatorioControllerBase.nomesDays');

  @override
  List<String> get nomesDays {
    _$nomesDaysAtom.reportRead();
    return super.nomesDays;
  }

  @override
  set nomesDays(List<String> value) {
    _$nomesDaysAtom.reportWrite(value, super.nomesDays, () {
      super.nomesDays = value;
    });
  }

  final _$nomesWeekAtom = Atom(name: '_RelatorioControllerBase.nomesWeek');

  @override
  List<String> get nomesWeek {
    _$nomesWeekAtom.reportRead();
    return super.nomesWeek;
  }

  @override
  set nomesWeek(List<String> value) {
    _$nomesWeekAtom.reportWrite(value, super.nomesWeek, () {
      super.nomesWeek = value;
    });
  }

  final _$nomesMonthAtom = Atom(name: '_RelatorioControllerBase.nomesMonth');

  @override
  List<String> get nomesMonth {
    _$nomesMonthAtom.reportRead();
    return super.nomesMonth;
  }

  @override
  set nomesMonth(List<String> value) {
    _$nomesMonthAtom.reportWrite(value, super.nomesMonth, () {
      super.nomesMonth = value;
    });
  }

  final _$xAtom = Atom(name: '_RelatorioControllerBase.x');

  @override
  int get x {
    _$xAtom.reportRead();
    return super.x;
  }

  @override
  set x(int value) {
    _$xAtom.reportWrite(value, super.x, () {
      super.x = value;
    });
  }

  final _$isSelectedAtom = Atom(name: '_RelatorioControllerBase.isSelected');

  @override
  List<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(List<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$_RelatorioControllerBaseActionController =
      ActionController(name: '_RelatorioControllerBase');

  @override
  dynamic teste(dynamic value) {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.teste');
    try {
      return super.teste(value);
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelected(int index) {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.setSelected');
    try {
      return super.setSelected(index);
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic getSpots(
      {int days, int month, int year, DateTime inicio, DateTime fim}) {
    final _$actionInfo = _$_RelatorioControllerBaseActionController.startAction(
        name: '_RelatorioControllerBase.getSpots');
    try {
      return super.getSpots(
          days: days, month: month, year: year, inicio: inicio, fim: fim);
    } finally {
      _$_RelatorioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listHistNivel: ${listHistNivel},
listHistAbastecimento: ${listHistAbastecimento},
listSpotsDays: ${listSpotsDays},
listSpotsWeek: ${listSpotsWeek},
listSpotsMonth: ${listSpotsMonth},
nomesDays: ${nomesDays},
nomesWeek: ${nomesWeek},
nomesMonth: ${nomesMonth},
x: ${x},
isSelected: ${isSelected}
    ''';
  }
}
