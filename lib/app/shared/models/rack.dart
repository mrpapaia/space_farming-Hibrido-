import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Rack {
  String idTouro;
  String tipo;
  String volume;
  String doseUp;
  String doseDown;
  DocumentReference ref;

  Rack(
      {this.idTouro,
      this.tipo,
      this.volume,
      this.doseUp,
      this.doseDown,
      this.ref});

  Map<String, dynamic> toMap() {
    return {
      'idTouro': idTouro,
      'tipo': tipo,
      'volume': volume,
      'doseUP': doseUp,
      'doseDown': doseDown,
    };
  }

  factory Rack.fromDoc(QueryDocumentSnapshot doc) {
    return Rack(
        idTouro: doc.data()['idTouro'],
        tipo: doc.data()['tipo'],
        volume: doc.data()['volume'],
        doseUp: doc.data()['doseUp'],
        doseDown: doc.data()['doseDown'],
        ref: doc.reference);
  }

  String toJson() => json.encode(toMap());

  factory Rack.fromJson(String source) => Rack.fromDoc(json.decode(source));

  @override
  String toString() {
    return 'Rack(idTouro: $idTouro, tipo: $tipo, volume: $volume, doseUp: $doseUp, doseDown: $doseDown)';
  }
}
