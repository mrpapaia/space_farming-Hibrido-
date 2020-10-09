import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';

class FarmRepository implements IRepositoryFarm {
  FirebaseFirestore firestore;
  FarmRepository(this.firestore);
  @override
  Future<bool> add(Farm farm) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<Farm>> list(String farmName) {
    return firestore
        .collection('farms')
        .where('email', isEqualTo: farmName)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Farm.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Farm obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
