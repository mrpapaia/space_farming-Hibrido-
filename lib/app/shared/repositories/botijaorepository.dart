import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

class BotijaoRepository implements IRepositoryBotijao {
  FirebaseFirestore firestore;
  DocumentReference doc;
  List<Botijao> listBotijao = List();
  List<Caneca> listCanecas = List();
  List<Rack> listRacks = List();

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
    return firestore
        .doc(this.doc.path)
        .collection("botijoes")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        //doc.reference.collection('canecas').snapshots().listen(getCanecas);
        return Botijao.fromMap(
            doc, getCanecas(doc.reference.collection('canecas').get()));
      }).toList();
    });
  }

  List<Caneca> getCanecas(Future<QuerySnapshot> snapshot) {
    List<Caneca> canecas = [];
    snapshot.then((value) {
      for (var doc in value.docs) {
        canecas.add(Caneca.fromMap(doc.reference, doc.data()["color"],
            getRacks(doc.reference.collection('racks').get())));
      }
    });
    return canecas;
  }

  List<Rack> getRacks(Future<QuerySnapshot> snapshot) {
    List<Rack> racks = [];
    snapshot.then((value) {
      value.docs.forEach((rack) {
        racks.add(Rack.fromMap(rack));
      });
    });
    return racks;
  }
}
