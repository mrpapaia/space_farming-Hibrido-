import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String nome;
  String cpf;
  String tel;
  String email;
  List<String> fazenda;
  User({
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

  factory User.fromMap(DocumentSnapshot doc) {
    return User(
      nome: doc.data()['nome'],
      cpf: doc.data()['cpf'],
      tel: doc.data()['tel'],
      email: doc.data()['email'],
      fazenda: List<String>.from(doc.data()['fazenda']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(nome: $nome, cpf: $cpf, tel: $tel, email: $email, fazenda: $fazenda)';
  }
}
