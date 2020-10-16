import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

class UserPRepository implements IRepositoryUserP {
  FirebaseFirestore firestore;
  UserPRepository(this.firestore);
  @override
  Future<bool> add(UserP farm) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<UserP>> list(String email) {
    return firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return UserP.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(UserP id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(UserP obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
