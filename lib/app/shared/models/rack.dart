import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Rack {
  String idTouro;
  String tipo;
  double volume;
  int doseUp;
  int doseDown;

  Rack({
    this.idTouro,
    this.tipo,
    this.volume,
    this.doseUp,
    this.doseDown,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTouro': idTouro,
      'tipo': tipo,
      'volume': volume,
      'doseUP': doseUp,
      'doseDown': doseDown,
    };
  }

  factory Rack.fromMap(DocumentSnapshot doc) {
    return Rack(
      idTouro: doc.data()['idTouro'],
      tipo: doc.data()['tipo'],
      volume: doc.data()['volume'],
      doseUp: doc.data()['doseUp'],
      doseDown: doc.data()['doseDown'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rack.fromJson(String source) => Rack.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rack(idTouro: $idTouro, tipo: $tipo, volume: $volume, doseUp: $doseUp, doseDown: $doseDown)';
  }
}
