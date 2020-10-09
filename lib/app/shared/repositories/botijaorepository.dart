import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

class BotijaoRepository implements IRepositoryBotijao {
  String _colecao = "botijoes";

  FirebaseFirestore firestore;
  BotijaoRepository(this.firestore);

  @override
  Future<bool> add(Botijao botijao) {
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Botijao> search(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Botijao obj) {
    throw UnimplementedError();
  }

  List<Rack> getRacks(CollectionReference collection) {
    List<Rack> listRacks = new List<Rack>();
    collection.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            listRacks.add(Rack.fromMap(doc.data()));
          }),
        });
    return listRacks;
  }

  Stream<List<Farm>> lista(String farmName) {
    return FirebaseFirestore.instance
        .collection('farms')
        .where('nome', isEqualTo: farmName)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Farm.fromMap(doc);
      }).toList();
    });
  }

  @override
  Stream<List<Botijao>> list(DocumentReference farm) {
    return firestore
        .doc(farm.path)
        .collection("botijoes")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Botijao.fromMap(doc);
      }).toList();
    });
  }
}
