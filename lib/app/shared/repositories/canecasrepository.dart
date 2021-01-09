import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';

class CanecasRepository implements IRepositoryCanecas {
  FirebaseFirestore firestore;
  DocumentReference doc;
  CanecasRepository(this.firestore);
  static List<Caneca> listCanecas = [];
  @override
  Future<void> add(String path, Caneca caneca) {
    return firestore
        .collection("farms/" + path + '/botijoes/canecas')
        .doc(caneca.id.toString())
        .set(caneca.toMap())
        .then((value) => print("Botijão adicionado com suecsso"))
        .catchError((error) => print("Failed to add botijao: $error"));
  }

  @override
  Stream<List<Caneca>> list(DocumentReference docRef) {
    return firestore
        .doc(docRef.path)
        .collection('canecas')
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return Caneca.fromDoc(
            doc.reference, doc.data()['color'], doc.data()['estado'], null);
      }).toList();
    });
  }

  @override
  Future<bool> remove(Caneca id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Caneca caneca) {
    print(caneca);
    caneca.id.update(caneca.toMap());
  }
}
