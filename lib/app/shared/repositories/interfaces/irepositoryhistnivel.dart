import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';

abstract class IRepositoryHistoricoNivel {
  Future<bool> add(HistoricoNivel histNivel);
  Future<bool> remove(String id);
  Future<bool> update(HistoricoNivel obj);
  Stream<List<HistoricoNivel>> list();
}
