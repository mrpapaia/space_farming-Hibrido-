import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';

abstract class IRepositoryBotijao {
  Future<bool> add(Botijao botijao);
  Future<bool> remove(String id);
  Future<bool> update(Botijao obj);
  Future<Botijao> search(String id);
  Stream<List<Botijao>> list(DocumentReference farm);
  Stream<List<Farm>> lista(String farmName);
}
