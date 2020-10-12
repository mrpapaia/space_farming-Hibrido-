import 'package:space_farming_modular/app/shared/models/user.dart';

abstract class IRepositoryUser {
  Future<void> add(User farm);
  Future<void> remove(User id);
  Future<void> update(User obj);
  Stream<List<User>> list(String email);
}
