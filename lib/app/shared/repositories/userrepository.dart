import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryuser.dart';

class UserPRepository implements IRepositoryUserP {
  FirebaseFirestore firestore;
  UserPRepository(this.firestore);
  @override
  Future<String> add(UserP user) {
    return firestore
        .collection('users')
        .add(user.toMap())
        .then((value) => value.id);
  }

  @override
  Stream<List<UserP>> list(String email) {
    return firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return UserP.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Stream<List<UserP>> listColab(String key, String value) {
    return firestore
        .collection('users')
        .where("fazenda.${key}", isEqualTo: value)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return UserP.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(UserP user) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(UserP user) {
    user.ref.update(user.toMap());
  }

  updateC(String email, String key, String value) {
    print(key);
    print(value);
    firestore
        .collection('users')
        .where("email", isEqualTo: email)
        .get()
        .then((query) {
      query.docs.forEach((element) {
        firestore.doc("users/" + element.id).update({"fazenda.${value}": key});
      });
    });
  }
}
