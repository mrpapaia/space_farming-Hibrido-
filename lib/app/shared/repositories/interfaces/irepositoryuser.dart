import 'package:space_farming_modular/app/shared/models/user.dart';

abstract class IRepositoryUser {
  Future<bool> add(User farm);
  Future<bool> remove(User id);
  Future<bool> update(User obj);
  Stream<List<User>> list(String email);
}
