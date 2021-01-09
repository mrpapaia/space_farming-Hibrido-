import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';

abstract class IRepositoryHistoricoAbastecimento {
  Future<void> add(DocumentReference doc, HistoricoAbastecimento histNivel);
  Future<void> remove(String id);
  Future<void> update(HistoricoAbastecimento obj);
  Stream<List<HistoricoAbastecimento>> list(DocumentReference doc);
}
