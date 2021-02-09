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
        .collection(doc.path + "/racks/")
        .add(rack.toMap())
        .then((value) => print("rack adicionado com suecsso"))
        .catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Stream<List<Rack>> list(DocumentReference caneca) {
    print(caneca.path);
    return firestore
        .doc(caneca.path)
        .collection("racks")
        .snapshots()
        .map((query) {
      return query.docs.map((docR) {
        return Rack.fromDoc(docR);
      }).toList();
    });
  }

  @override
  Future<void> remove(String id) {
    return firestore.doc(id).delete();
  }

  @override
  Future<void> update(Rack rack) {
    return firestore
        .doc(rack.ref.path)
        .set(rack.toMap())
        .then((value) => print("Rack atualizado"))
        .catchError((error) => print("Failed to delete Rack: $error"));
  }
}
