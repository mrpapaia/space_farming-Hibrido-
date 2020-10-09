import 'package:space_farming_modular/app/shared/models/farm.dart';

abstract class IRepositoryFarm {
  Future<bool> add(Farm farm);
  Future<bool> remove(String id);
  Future<bool> update(Farm obj);

  Stream<List<Farm>> list(String farmName);
}
