import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserP {
  String nome;
  String cpf;
  String tel;
  String email;
  Map<String, String> fazenda;
  DocumentReference ref;
  UserP({
    this.nome,
    this.cpf,
    this.tel,
    this.email,
    this.fazenda,
    this.ref,
  });

  UserP copyWith({
    String nome,
    String cpf,
    String tel,
    String email,
    Map<String, String> fazenda,
    DocumentReference ref,
  }) {
    return UserP(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      tel: tel ?? this.tel,
      email: email ?? this.email,
      fazenda: fazenda ?? this.fazenda,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'tel': tel,
      'email': email,
      'fazenda': fazenda,
    };
  }

  factory UserP.fromDoc(DocumentSnapshot doc) {
    return UserP(
      nome: doc.data()['nome'],
      cpf: doc.data()['cpf'],
      tel: doc.data()['tel'],
      email: doc.data()['email'],
      fazenda: Map<String, String>.from(doc['fazenda']),
      ref: doc.reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserP.fromJson(String source) => UserP.fromDoc(json.decode(source));

  @override
  String toString() {
    return 'UserP(nome: $nome, cpf: $cpf, tel: $tel, email: $email, fazenda: $fazenda)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserP &&
        o.nome == nome &&
        o.cpf == cpf &&
        o.tel == tel &&
        o.email == email &&
        mapEquals(o.fazenda, fazenda);
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        cpf.hashCode ^
        tel.hashCode ^
        email.hashCode ^
        fazenda.hashCode;
  }
}
