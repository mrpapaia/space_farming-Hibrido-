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
  Future<void> add(Rack farm) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<Rack>> list() {
    print(this.doc.path);
    return firestore
        .doc(this.doc.path)
        .collection("racks")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Rack.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<void> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> update(Rack obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
