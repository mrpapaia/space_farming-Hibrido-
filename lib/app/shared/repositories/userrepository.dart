import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

class UserRepository implements IRepositoryUser {
  FirebaseFirestore firestore;
  UserRepository(this.firestore);
  @override
  Future<bool> add(User farm) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<User>> list(String email) {
    return firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return User.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(User id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(User obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
