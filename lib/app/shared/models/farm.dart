import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Farm {
  String nome;
  String email;
  DocumentReference ref;
  Farm({
    this.nome,
    this.email,
    this.ref,
  });

  Farm copyWith({
    String nome,
    String email,
    DocumentReference ref,
  }) {
    return Farm(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      ref: ref ?? this.ref,
    );
  }

  factory Farm.fromMap(DocumentSnapshot doc) {
    return Farm(
      nome: doc.data()['nome'],
      email: doc.data()['email'],
      ref: doc.reference,
    );
  }

  factory Farm.fromJson(String source) => Farm.fromMap(json.decode(source));

  @override
  String toString() => 'Farm(nome: $nome, email: $email, ref: $ref)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Farm && o.nome == nome && o.email == email && o.ref == ref;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ ref.hashCode;
}
