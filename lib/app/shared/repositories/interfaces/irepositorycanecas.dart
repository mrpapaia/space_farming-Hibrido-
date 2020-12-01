import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';

abstract class IRepositoryCanecas {
  Future<void> add(String path, Caneca caneca);
  Future<bool> remove(Caneca id);
  Future<bool> update(Caneca obj);
  Stream<List<Caneca>> list(DocumentReference doc);
}
