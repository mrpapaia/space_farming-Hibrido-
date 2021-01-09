import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

class HistoricoNivelRepository implements IRepositoryHistoricoNivel {
  FirebaseFirestore firestore;

  HistoricoNivelRepository(this.firestore);

  @override
  Stream<List<HistoricoNivel>> list(DocumentReference doc) {
    return firestore
        .doc(doc.path)
        .collection("existente")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return HistoricoNivel.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Future<void> add(DocumentReference doc, HistoricoNivel histNivel) {
    return firestore
        .doc(doc.path)
        .collection("existente")
        .add(histNivel.toMap())
        .then((value) => print("SUcesso"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Future<void> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> update(HistoricoNivel obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
