import 'package:space_farming_modular/app/shared/models/user.dart';

abstract class IRepositoryUserP {
  Future<String> add(UserP user);
  Future<void> remove(UserP id);
  Future<void> update(UserP obj);
  Stream<List<UserP>> list(String email);
}
