import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

class BotijaoRepository implements IRepositoryBotijao {
  String _colecao = "botijoes";

  FirebaseFirestore firestore;
  DocumentReference doc;
  static List<Caneca> listCanecas = [];
  static List<Rack> listRacks = [];
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
  Future<void> update(Botijao obj) {
    return firestore
        .doc(doc.path + "/botijoes/" + obj.idBot)
        .update({'volAtual': obj.volAtual})
        .then((value) => print("Volume atualizado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Stream<List<Botijao>> list() {
    listCanecas = [];
    return firestore
        .doc(this.doc.path)
        .collection("botijoes")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        doc.reference.collection('canecas').snapshots().listen((getCanecas));

        return Botijao.fromMap(doc, listCanecas);
      }).toList();
    });
  }

  getCanecas(QuerySnapshot snapshot) async {
    for (var doc in snapshot.docs) {
      getRacks(doc).listen((event) {
        listCanecas.add(Caneca.fromMap(doc.reference, event));
      });
    }
  }

  Stream<List<Rack>> getRacks(DocumentSnapshot doc) {
    return firestore
        .doc(doc.reference.path)
        .collection("racks")
        .snapshots()
        .map((query) {
      return query.docs.map((docR) {
        return Rack.fromMap(docR);
      }).toList();
    });
  }
}
