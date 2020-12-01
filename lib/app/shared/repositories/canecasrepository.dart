import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';

class CanecasRepository implements IRepositoryCanecas {
  FirebaseFirestore firestore;
  DocumentReference doc;
  CanecasRepository(this.firestore);
  static List<Caneca> listCanecas = [];
  @override
  Future<bool> add(Caneca farm) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<Caneca>> list(DocumentReference docRef) {
    return firestore
        .doc(docRef.path)
        .collection('canecas')
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Caneca.fromDoc(doc.reference, doc.data()['color'], null);
      }).toList();
    });
  }

  @override
  Future<bool> remove(Caneca id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Caneca obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
