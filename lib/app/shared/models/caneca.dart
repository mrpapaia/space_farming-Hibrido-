import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Caneca {
  DocumentReference id;
  //List<Rack> racks;
  Caneca({
    // this.racks,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  factory Caneca.fromJson(String source) => Caneca.fromMap(json.decode(source));

  @override
  String toString() => 'Caneca(id: $id)';

  Caneca copyWith({
    String id,
  }) {
    return Caneca(
      id: id ?? this.id,
    );
  }

  factory Caneca.fromMap(DocumentSnapshot doc) {
    return Caneca(
      id: doc.reference,
      // racks: List<Rack>.from(doc.data()['racks']?.map((x) => Rack.fromMap(x))),
    );
  }
}
