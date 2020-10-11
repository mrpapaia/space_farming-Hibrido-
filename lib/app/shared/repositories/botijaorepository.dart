import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

class BotijaoRepository implements IRepositoryBotijao {
  String _colecao = "botijoes";

  FirebaseFirestore firestore;
  DocumentReference doc;
  BotijaoRepository(this.firestore, this.doc);

  @override
  Future<void> add(Botijao botijao) {
    return doc
        .collection('botijoes')
        .doc(botijao.idBot)
        .set(botijao.toMap())
        .then((value) => print("Botijão adicionado com suecsso"))
        .catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Future<void> remove(String id) {
    print(doc.path + "botijoes" + id);
    return firestore
        .doc(doc.path + "/botijoes/" + id)
        .delete()
        .then((value) => print("botijao deletado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Future<Botijao> search(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Botijao obj) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Botijao>> list() {
    return firestore
        .doc(this.doc.path)
        .collection("botijoes")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Botijao.fromMap(doc);
      }).toList();
    });
  }
}
