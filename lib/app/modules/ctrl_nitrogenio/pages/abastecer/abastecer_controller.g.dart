// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abastecer_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AbastecerController = BindInject(
  (i) => AbastecerController(
      i<IRepositoryHistoricoAbastecimento>(), i<IRepositoryBotijao>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AbastecerController on _AbastecerControllerBase, Store {
  final _$volAtualAtom = Atom(name: '_AbastecerControllerBase.volAtual');

  @override
  double get volAtual {
    _$volAtualAtom.reportRead();
    return super.volAtual;
  }

  @override
  set volAtual(double value) {
    _$volAtualAtom.reportWrite(value, super.volAtual, () {
      super.volAtual = value;
    });
  }

  final _$precoAtom = Atom(name: '_AbastecerControllerBase.preco');

  @override
  double get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  final _$dataAtom = Atom(name: '_AbastecerControllerBase.data');

  @override
  DateTime get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$_AbastecerControllerBaseActionController =
      ActionController(name: '_AbastecerControllerBase');

  @override
  dynamic getVol(String vol) {
    final _$actionInfo = _$_AbastecerControllerBaseActionController.startAction(
        name: '_AbastecerControllerBase.getVol');
    try {
      return super.getVol(vol);
    } finally {
      _$_AbastecerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData(String data) {
    final _$actionInfo = _$_AbastecerControllerBaseActionController.startAction(
        name: '_AbastecerControllerBase.getData');
    try {
      return super.getData(data);
    } finally {
      _$_AbastecerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPreco(String preco) {
    final _$actionInfo = _$_AbastecerControllerBaseActionController.startAction(
        name: '_AbastecerControllerBase.getPreco');
    try {
      return super.getPreco(preco);
    } finally {
      _$_AbastecerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(DocumentReference ref, double vol, UserP user) {
    final _$actionInfo = _$_AbastecerControllerBaseActionController.startAction(
        name: '_AbastecerControllerBase.update');
    try {
      return super.update(ref, vol, user);
    } finally {
      _$_AbastecerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
volAtual: ${volAtual},
preco: ${preco},
data: ${data}
    ''';
  }
}
