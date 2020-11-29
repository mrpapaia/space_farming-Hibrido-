import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';

abstract class IRepositoryHistoricoAbastecimento {
  Future<void> add(HistoricoAbastecimento histNivel);
  Future<void> remove(String id);
  Future<void> update(HistoricoAbastecimento obj);
  Stream<List<HistoricoAbastecimento>> list();
}
