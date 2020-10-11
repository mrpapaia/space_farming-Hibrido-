import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';

abstract class IRepositoryHistoricoAbastecimento {
  Future<bool> add(HistoricoAbastecimento histNivel);
  Future<bool> remove(String id);
  Future<bool> update(HistoricoAbastecimento obj);
  Stream<List<HistoricoAbastecimento>> list();
}
