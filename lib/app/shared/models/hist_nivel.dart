import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoNivel {
  String respon;
  double qtdAtual;
  DateTime data;
  HistoricoNivel({
    this.respon,
    this.qtdAtual,
    this.data,
  });

  HistoricoNivel copyWith({
    String respon,
    double qtdAtual,
    DateTime data,
  }) {
    return HistoricoNivel(
      respon: respon ?? this.respon,
      qtdAtual: qtdAtual ?? this.qtdAtual,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'respon': respon,
      'qtdAtual': qtdAtual,
      'data': Timestamp.fromDate(data),
    };
  }

  factory HistoricoNivel.fromMap(DocumentSnapshot doc) {
    return HistoricoNivel(
      respon: doc.data()['respon'],
      qtdAtual: doc.data()['qtdAtual'],
      data: doc.data()['data'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricoNivel.fromJson(String source) =>
      HistoricoNivel.fromMap(json.decode(source));

  @override
  String toString() =>
      'HistoricoNivel(respon: $respon, qtdAtual: $qtdAtual, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HistoricoNivel &&
        o.respon == respon &&
        o.qtdAtual == qtdAtual &&
        o.data == data;
  }

  @override
  int get hashCode => respon.hashCode ^ qtdAtual.hashCode ^ data.hashCode;
}
