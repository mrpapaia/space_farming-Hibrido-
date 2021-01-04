import 'package:space_farming_modular/app/shared/models/user.dart';

abstract class IRepositoryUserP {
  Future<String> add(UserP user);
  Future<void> remove(UserP id);
  Future<void> update(UserP user);
  Stream<List<UserP>> list(String email);
  Stream<List<UserP>> listColab(String key, String value);
}
