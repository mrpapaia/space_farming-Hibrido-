import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryrack.dart';

class RackRepository implements IRepositoryRack {
  FirebaseFirestore firestore;
  DocumentReference doc;
  RackRepository(
    this.firestore,
    this.doc,
  );
  @override
  Future<void> add(Rack rack) async {
    return firestore
        .doc(doc.path)
        .set(rack.toMap())
        .then((value) => print("rack adicionado com suecsso"))
        .catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Stream<List<Rack>> list() {
    return firestore
        .doc(this.doc.path)
        .collection("racks")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Rack.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Future<void> remove(String id) {
    return firestore.doc(id).delete();
  }

  @override
  Future<void> update(Rack obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
