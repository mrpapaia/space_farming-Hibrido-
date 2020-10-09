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
  List<Caneca> canecas;
  Botijao({
    this.idBot,
    this.qtdDose,
    this.volAtual,
    this.volTotal,
    this.numcanecas,
    this.ref,
    this.canecas,
  });

  Botijao copyWith({
    String idBot,
    int qtdDose,
    double volAtual,
    double volTotal,
    int numcanecas,
    DocumentReference ref,
    List<Caneca> canecas,
  }) {
    return Botijao(
      idBot: idBot ?? this.idBot,
      qtdDose: qtdDose ?? this.qtdDose,
      volAtual: volAtual ?? this.volAtual,
      volTotal: volTotal ?? this.volTotal,
      numcanecas: numcanecas ?? this.numcanecas,
      ref: ref ?? this.ref,
      canecas: canecas ?? this.canecas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idBot': idBot,
      'qtdDose': qtdDose,
      'volAtual': volAtual,
      'volTotal': volTotal,
      'numcanecas': numcanecas,
      'ref': ref,
      'canecas': canecas?.map((x) => x?.toMap())?.toList(),
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
    // this.canecas =
    //    List<Caneca>.from(map['canecas']?.map((x) => Caneca.fromMap(x)));
  }
  String toJson() => json.encode(toMap());

  factory Botijao.fromJson(String source) =>
      Botijao.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Botijao(idBot: $idBot, qtdDose: $qtdDose, volAtual: $volAtual, volTotal: $volTotal, numcanecas: $numcanecas, ref: $ref, canecas: $canecas)';
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
        o.ref == ref &&
        listEquals(o.canecas, canecas);
  }

  @override
  int get hashCode {
    return idBot.hashCode ^
        qtdDose.hashCode ^
        volAtual.hashCode ^
        volTotal.hashCode ^
        numcanecas.hashCode ^
        ref.hashCode ^
        canecas.hashCode;
  }
}
