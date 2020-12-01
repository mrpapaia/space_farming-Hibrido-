import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';

class HistoricoAbastecimentoRepository
    implements IRepositoryHistoricoAbastecimento {
  FirebaseFirestore firestore;
  DocumentReference doc;
  HistoricoAbastecimentoRepository(this.firestore, this.doc);
  @override
  Future<void> add(HistoricoAbastecimento histNivel) {
    return firestore
        .doc(this.doc.path)
        .collection("recarga")
        .add(histNivel.toMap())
        .then((value) => print("SUcesso"))
        .catchError((error) => print("Failed to delete botijao: $error"));
  }

  @override
  Stream<List<HistoricoAbastecimento>> list() {
    return firestore
        .doc(this.doc.path)
        .collection("recarga")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
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
