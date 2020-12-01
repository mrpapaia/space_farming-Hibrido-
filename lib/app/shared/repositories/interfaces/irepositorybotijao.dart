import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';

abstract class IRepositoryBotijao {
  Future<void> add(Botijao botijao);
  Future<void> remove(String id);
  Future<void> update(Botijao obj);
  Future<Botijao> search(String id);
  Stream<List<Botijao>> list(String path);
}
