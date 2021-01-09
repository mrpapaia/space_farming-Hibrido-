import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';

class HistoricoAbastecimentoRepository
    implements IRepositoryHistoricoAbastecimento {
  FirebaseFirestore firestore;

  HistoricoAbastecimentoRepository(this.firestore);
  @override
  Future<void> add(DocumentReference doc, HistoricoAbastecimento histNivel) {
    return firestore
        .doc(doc.path)
        .collection("recarga")
        .add(histNivel.toMap())
        .then((value) => print("SUcesso"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Stream<List<HistoricoAbastecimento>> list(DocumentReference doc) {
    return firestore
        .doc(doc.path)
        .collection("recarga")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        print(HistoricoAbastecimento.fromDoc(doc));
        return HistoricoAbastecimento.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Future<void> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> update(HistoricoAbastecimento obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
