import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserP {
  String nome;
  String cpf;
  String tel;
  String email;
  List<String> fazenda;
  UserP({
    this.nome,
    this.cpf,
    this.tel,
    this.email,
    this.fazenda,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'tel': tel,
      'email': email,
      'fazenda': fazenda,
    };
  }

  factory UserP.fromMap(DocumentSnapshot doc) {
    return UserP(
      nome: doc.data()['nome'],
      cpf: doc.data()['cpf'],
      tel: doc.data()['tel'],
      email: doc.data()['email'],
      fazenda: List<String>.from(doc.data()['fazenda']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserP.fromJson(String source) => UserP.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserP(nome: $nome, cpf: $cpf, tel: $tel, email: $email, fazenda: $fazenda)';
  }
}
