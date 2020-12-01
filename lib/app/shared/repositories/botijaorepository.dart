import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';

class BotijaoRepository implements IRepositoryBotijao {
  FirebaseFirestore firestore;

  List<Botijao> listBotijao = List();
  List<Caneca> listCanecas = List();
  List<Rack> listRacks = List();

  BotijaoRepository(this.firestore);

  @override
  Future<void> add(Botijao botijao) {
    return firestore
        .collection('botijoes')
        .doc(botijao.idBot)
        .set(botijao.toMap())
        .then((value) => print("Botijão adicionado com suecsso"))
        .catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Future<void> remove(String id) {
    return firestore
        .doc(id + "/botijoes/" + id)
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
        .doc("a" + "/botijoes/" + obj.idBot)
        .update({'volAtual': obj.volAtual})
        .then((value) => print("Volume atualizado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Future<List<Botijao>> list(String path) async {
    List<Botijao> listBotijoes = [];
    await firestore
        .doc("farms/" + path)
        .collection("botijoes")
        .get()
        .then((listBot) {
      listBot.docs.forEach((bot) {
        getCanecas(bot.reference.collection('canecas').get())
            .then((value) => listBotijoes.add(Botijao.fromDoc(bot, value)));
      });
    });

    return listBotijoes;
  }

  Future<List<Caneca>> getCanecas(Future<QuerySnapshot> snapshot) async {
    List<Caneca> canecas = [];
    await snapshot.then((value) {
      for (var doc in value.docs) {
        getRacks(doc.reference.collection('racks').get()).then((value) =>
            canecas.add(
                Caneca.fromDoc(doc.reference, doc.data()["color"], value)));
      }
    });
    return canecas;
  }

  Future<List<Rack>> getRacks(Future<QuerySnapshot> snapshot) async {
    List<Rack> racks = [];
    await snapshot.then((value) {
      value.docs.forEach((rack) {
        racks.add(Rack.fromDoc(rack));
      });
    });
    return racks;
  }
}
