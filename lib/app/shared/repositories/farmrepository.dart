import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';

class FarmRepository implements IRepositoryFarm {
  FirebaseFirestore firestore;
  FarmRepository(this.firestore);
  @override
  Future<String> add(Farm farm) async {
    return firestore
        .collection('farms')
        .add(farm.toMap())
        .then((value) => value.id);
  }

  @override
  Stream<List<Farm>> list(String farmName) {
    return firestore
        .collection('farms')
        .where('nome', isEqualTo: farmName)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Farm.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(String id) {
    firestore.doc("farms/" + id).delete();
  }

  @override
  Future<bool> update(Farm obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
