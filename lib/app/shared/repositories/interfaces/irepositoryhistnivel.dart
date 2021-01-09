import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';

abstract class IRepositoryHistoricoNivel {
  Future<void> add(DocumentReference doc, HistoricoNivel histNivel);
  Future<void> remove(String id);
  Future<void> update(HistoricoNivel obj);
  Stream<List<HistoricoNivel>> list(DocumentReference doc);
}
