import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/modules/home/components/hexcolor.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';

class Caneca {
  DocumentReference id;
  Color color;
  List<Rack> racks;
  String estado;
  Caneca({
    this.id,
    this.color,
    this.estado,
    this.racks,
  });

  Caneca copyWith({
    DocumentReference id,
    Color color,
    List<Rack> racks,
  }) {
    return Caneca(
      id: id ?? this.id,
      color: color ?? this.color,
      racks: racks ?? this.racks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'color': "#" + color.value.toRadixString(16).substring(2),
      'estado': estado,
      //'racks': racks?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Caneca.fromDoc(
      DocumentReference doc, String color, String estado, List<Rack> racks) {
    return Caneca(
      id: doc,
      color: HexColor(color),
      estado: estado,
      racks: racks,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Caneca(id: $id, color: $color, racks: $racks)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Caneca &&
        o.id == id &&
        o.color == color &&
        listEquals(o.racks, racks);
  }

  @override
  int get hashCode => id.hashCode ^ color.hashCode ^ racks.hashCode;
}
