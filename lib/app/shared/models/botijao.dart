import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'caneca.dart';

class Botijao {
  String idBot;
  int qtdDose;
  double volAtual;
  double volTotal;
  int numcanecas;
  DocumentReference ref;

  Botijao({
    this.idBot,
    this.qtdDose,
    this.volAtual,
    this.volTotal,
    this.numcanecas,
    this.ref,
  });

  Botijao copyWith({
    String idBot,
    int qtdDose,
    double volAtual,
    double volTotal,
    int numcanecas,
    DocumentReference ref,
  }) {
    return Botijao(
      idBot: idBot ?? this.idBot,
      qtdDose: qtdDose ?? this.qtdDose,
      volAtual: volAtual ?? this.volAtual,
      volTotal: volTotal ?? this.volTotal,
      numcanecas: numcanecas ?? this.numcanecas,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idBot': idBot,
      'qtdDose': qtdDose,
      'volAtual': volAtual,
      'volTotal': volTotal,
      'numcanecas': numcanecas,
    };
  }

  factory Botijao.fromMap(DocumentSnapshot doc) {
    return Botijao(
        idBot: doc.data()['idBot'],
        qtdDose: doc.data()['qtdDose'],
        volAtual: doc.data()['volAtual'],
        volTotal: doc.data()['volTotal'],
        numcanecas: doc.data()['numcanecas'],
        ref: doc.reference);
  }
  String toJson() => json.encode(toMap());

  factory Botijao.fromJson(String source) =>
      Botijao.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Botijao(idBot: $idBot, qtdDose: $qtdDose, volAtual: $volAtual, volTotal: $volTotal, numcanecas: $numcanecas, ref: $ref)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Botijao &&
        o.idBot == idBot &&
        o.qtdDose == qtdDose &&
        o.volAtual == volAtual &&
        o.volTotal == volTotal &&
        o.numcanecas == numcanecas &&
        o.ref == ref;
  }

  @override
  int get hashCode {
    return idBot.hashCode ^
        qtdDose.hashCode ^
        volAtual.hashCode ^
        volTotal.hashCode ^
        numcanecas.hashCode ^
        ref.hashCode;
  }
}
