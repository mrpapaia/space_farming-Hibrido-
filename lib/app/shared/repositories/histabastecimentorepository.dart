import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';

class HistoricoAbastecimentoRepository
    implements IRepositoryHistoricoAbastecimento {
  FirebaseFirestore firestore;
  DocumentReference doc;
  HistoricoAbastecimentoRepository(this.firestore, this.doc);
  @override
  Future<bool> add(HistoricoAbastecimento histNivel) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Stream<List<HistoricoAbastecimento>> list() {
    print("Abastecimento" + this.doc.toString());
    return firestore
        .doc(this.doc.path)
        .collection("recarga")
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return HistoricoAbastecimento.fromMap(doc);
      }).toList();
    });
  }

  @override
  Future<bool> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> update(HistoricoAbastecimento obj) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
