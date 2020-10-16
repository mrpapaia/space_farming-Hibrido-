import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';

class Caneca {
  DocumentReference id;
  List<Rack> racks;
  Caneca({
    this.id,
    this.racks,
  });

  Caneca copyWith({
    DocumentReference id,
    List<Rack> racks,
  }) {
    return Caneca(
      id: id ?? this.id,
      racks: racks ?? this.racks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'racks': racks?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Caneca.fromMap(DocumentReference doc, List<Rack> listCanecas) {
    return Caneca(
      id: doc,
      racks: listCanecas,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Caneca(id: $id, racks: $racks)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Caneca && o.id == id && listEquals(o.racks, racks);
  }

  @override
  int get hashCode => id.hashCode ^ racks.hashCode;
}
