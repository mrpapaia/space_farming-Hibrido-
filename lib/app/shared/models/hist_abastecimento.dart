import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoAbastecimento {
  String respon;
  double qtdAtual;
  double qtdAdd;
  double preco;
  DateTime data;
  HistoricoAbastecimento({
    this.respon,
    this.qtdAtual,
    this.qtdAdd,
    this.preco,
    this.data,
  });

  HistoricoAbastecimento copyWith({
    String respon,
    double qtdAtual,
    double qtdAdd,
    double preco,
    DateTime data,
  }) {
    return HistoricoAbastecimento(
      respon: respon ?? this.respon,
      qtdAtual: qtdAtual ?? this.qtdAtual,
      qtdAdd: qtdAdd ?? this.qtdAdd,
      preco: preco ?? this.preco,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'respon': respon,
      'qtdAnt': qtdAtual,
      'qtdAdd': qtdAdd,
      'preco': preco,
      'data': Timestamp.fromDate(data),
    };
  }

  factory HistoricoAbastecimento.fromDoc(DocumentSnapshot doc) {
    return HistoricoAbastecimento(
      respon: doc.data()['respon'],
      qtdAtual: doc.data()['qtdAnt'],
      qtdAdd: doc.data()['qtdAdd'],
      preco: doc.data()['preco'],
      data: doc.data()['data'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricoAbastecimento.fromJson(String source) =>
      HistoricoAbastecimento.fromDoc(json.decode(source));

  @override
  String toString() {
    return 'HistoricoAbastecimento(respon: $respon, qtdAtual: $qtdAtual, qtdAdd: $qtdAdd, preco: $preco, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HistoricoAbastecimento &&
        o.respon == respon &&
        o.qtdAtual == qtdAtual &&
        o.qtdAdd == qtdAdd &&
        o.preco == preco &&
        o.data == data;
  }

  @override
  int get hashCode {
    return respon.hashCode ^
        qtdAtual.hashCode ^
        qtdAdd.hashCode ^
        preco.hashCode ^
        data.hashCode;
  }
}
