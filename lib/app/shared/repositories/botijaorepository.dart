import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/modules/home/components/hexcolor.dart';
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
  Future<bool> add(String path, Botijao botijao) {
    String pathF = "farms/" + path + '/botijoes';
    print(pathF);
    return firestore
        .collection(pathF)
        .doc(botijao.idBot)
        .set(botijao.toMap())
        .then((value) {
      for (int i = 0; i < botijao.numcanecas; i++) {
        firestore
            .collection(
                "farms/" + path + '/botijoes/' + botijao.idBot + '/canecas')
            .doc((i + 1).toString())
            .set(Caneca(color: HexColor("#adadad"), estado: "disabled").toMap())
            .then((value) => print("Caneca adicionado com suecsso"))
            .catchError((error) => print("Failed to add botijao: $error"));
      }
    }).catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Future<void> remove(String path) {
    return firestore
        .doc(path)
        .delete()
        .then((value) => print("botijao deletado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Future<Botijao> search(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateVol(Botijao obj) {
    return firestore
        .doc(obj.ref.path)
        .update({'volAtual': obj.volAtual.toString()})
        .then((value) => print("Volume atualizado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Future<void> updateBot(Botijao bot) {
    return firestore
        .doc(bot.ref.path)
        .set(bot.toMap())
        .then((value) => print("Botijão atualizado"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Stream<List<Botijao>> list(String path) {
    return firestore
        .doc("farms/" + path)
        .collection("botijoes")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        //doc.reference.collection('canecas').snapshots().listen(getCanecas);
        return Botijao.fromDoc(
            doc, getCanecas(doc.reference.collection('canecas').get()));
      }).toList();
    });
  }

  List<Caneca> getCanecas(Future<QuerySnapshot> snapshot) {
    List<Caneca> canecas = [];
    snapshot.then((value) {
      for (var doc in value.docs) {
        canecas.add(Caneca.fromDoc(
            doc.reference,
            doc.data()["color"],
            doc.data()['estado'],
            getRacks(doc.reference.collection('racks').get())));
      }
    });

    return canecas;
  }

  List<Rack> getRacks(Future<QuerySnapshot> snapshot) {
    List<Rack> racks = [];
    snapshot.then((value) {
      value.docs.forEach((rack) {
        racks.add(Rack.fromDoc(rack));
      });
    });
    return racks;
  }
}
