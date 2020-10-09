// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(i<IRepositoryFarm>(), i<IRepositoryUser>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$farmAtom = Atom(name: '_LoginControllerBase.farm');

  @override
  ObservableStream<List<Farm>> get farm {
    _$farmAtom.reportRead();
    return super.farm;
  }

  @override
  set farm(ObservableStream<List<Farm>> value) {
    _$farmAtom.reportWrite(value, super.farm, () {
      super.farm = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  ObservableStream<List<User>> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableStream<List<User>> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic getUser(String email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.getUser');
    try {
      return super.getUser(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isSuccefull(DocumentReference doc) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.isSuccefull');
    try {
      return super.isSuccefull(doc);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
farm: ${farm},
user: ${user}
    ''';
  }
}
