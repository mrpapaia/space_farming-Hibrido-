// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IRepositoryBotijao>(), i<IRepositoryUserP>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listBotAtom = Atom(name: '_HomeControllerBase.listBot');

  @override
  List<Botijao> get listBot {
    _$listBotAtom.reportRead();
    return super.listBot;
  }

  @override
  set listBot(List<Botijao> value) {
    _$listBotAtom.reportWrite(value, super.listBot, () {
      super.listBot = value;
    });
  }

  final _$userAtom = Atom(name: '_HomeControllerBase.user');

  @override
  ObservableStream<List<UserP>> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableStream<List<UserP>> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getBotAsyncAction = AsyncAction('_HomeControllerBase.getBot');

  @override
  Future<List<Botijao>> getBot(String path) {
    return _$getBotAsyncAction.run(() => super.getBot(path));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic getUser(String email) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getUser');
    try {
      return super.getUser(email);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listBot: ${listBot},
user: ${user}
    ''';
  }
}
