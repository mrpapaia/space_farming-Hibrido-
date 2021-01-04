import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';

abstract class IRepositoryFarm {
  Future<String> add(Farm farm);
  Future<bool> remove(String id);
  Future<bool> update(Farm obj);

  Stream<List<Farm>> list(String farmName);
}
