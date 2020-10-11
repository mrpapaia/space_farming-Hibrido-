import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

class HistoricoNivelRepository implements IRepositoryHistoricoNivel {
  FirebaseFirestore firestore;
  DocumentReference doc;
  HistoricoNivelRepository(this.firestore, this.doc);

  @override
  Stream<List<HistoricoNivel>> list() {
    return firestore
        .doc(this.doc.path)
        .collection("existente")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return HistoricoNivel.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<bool> add(HistoricoNivel histNivel) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(HistoricoNivel obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
