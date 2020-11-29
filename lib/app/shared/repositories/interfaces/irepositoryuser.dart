import 'package:space_farming_modular/app/shared/models/user.dart';

abstract class IRepositoryUserP {
  Future<void> add(UserP farm);
  Future<void> remove(UserP id);
  Future<void> update(UserP obj);
  Stream<List<UserP>> list(String email);
}
