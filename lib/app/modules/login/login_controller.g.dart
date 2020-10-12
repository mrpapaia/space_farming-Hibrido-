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

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwdAtom = Atom(name: '_LoginControllerBase.passwd');

  @override
  String get passwd {
    _$passwdAtom.reportRead();
    return super.passwd;
  }

  @override
  set passwd(String value) {
    _$passwdAtom.reportWrite(value, super.passwd, () {
      super.passwd = value;
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
  dynamic isSuccefull(DocumentReference doc, User user) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.isSuccefull');
    try {
      return super.isSuccefull(doc, user);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEmail(String email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.getEmail');
    try {
      return super.getEmail(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPasswd(String passwd) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.getPasswd');
    try {
      return super.getPasswd(passwd);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String valideteEmail(String email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.valideteEmail');
    try {
      return super.valideteEmail(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validetePasswd() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validetePasswd');
    try {
      return super.validetePasswd();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
farm: ${farm},
user: ${user},
email: ${email},
passwd: ${passwd}
    ''';
  }
}
