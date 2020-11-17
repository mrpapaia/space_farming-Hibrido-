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
  List<Caneca> canecas;
  DocumentReference ref;
  Botijao({
    this.idBot,
    this.qtdDose,
    this.volAtual,
    this.volTotal,
    this.numcanecas,
    this.canecas,
    this.ref,
  });

  Botijao copyWith({
    String idBot,
    int qtdDose,
    double volAtual,
    double volTotal,
    int numcanecas,
    int canecas,
    DocumentReference ref,
  }) {
    return Botijao(
      idBot: idBot ?? this.idBot,
      qtdDose: qtdDose ?? this.qtdDose,
      volAtual: volAtual ?? this.volAtual,
      volTotal: volTotal ?? this.volTotal,
      numcanecas: numcanecas ?? this.numcanecas,
      canecas: canecas ?? this.canecas,
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
      'canecas': canecas,
      //'ref': ref?.toMap(),
    };
  }

  factory Botijao.fromMap(DocumentSnapshot doc, List<Caneca> listCaneca) {
    return Botijao(
      idBot: doc.data()['idBot'],
      qtdDose: int.parse(doc.data()['qtdDose']),
      volAtual: double.parse(doc.data()['volAtual']),
      volTotal: double.parse(doc.data()['volTotal']),
      numcanecas: int.parse(doc.data()['numcanecas']),
      canecas: listCaneca,
      ref: doc.reference,
    );
  }

  @override
  String toString() {
    return 'Botijao(idBot: $idBot, qtdDose: $qtdDose, volAtual: $volAtual, volTotal: $volTotal, numcanecas: $numcanecas, canecas: $canecas, ref: $ref)';
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
        o.canecas == canecas &&
        o.ref == ref;
  }

  @override
  int get hashCode {
    return idBot.hashCode ^
        qtdDose.hashCode ^
        volAtual.hashCode ^
        volTotal.hashCode ^
        numcanecas.hashCode ^
        canecas.hashCode ^
        ref.hashCode;
  }
}
