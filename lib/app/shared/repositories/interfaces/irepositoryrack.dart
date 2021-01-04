import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';

abstract class IRepositoryRack {
  Future<void> add(Rack farm);
  Future<void> remove(String id);
  Future<void> update(Rack obj);
  Stream<List<Rack>> list(DocumentReference caneca);
}
