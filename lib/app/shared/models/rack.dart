import 'dart:convert';

class Rack {
  String idTouro;
  String tipo;
  double volume;
  int doseUP;
  int doseDown;

  Rack({
    this.idTouro,
    this.tipo,
    this.volume,
    this.doseUP,
    this.doseDown,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTouro': idTouro,
      'tipo': tipo,
      'volume': volume,
      'doseUP': doseUP,
      'doseDown': doseDown,
    };
  }

  Rack.fromMap(Map<String, dynamic> map) {
    this.idTouro = map['idTouro'];
    this.tipo = map['tipo'];
    this.volume = map['volume'];
    this.doseUP = map['doseUP'];
    this.doseDown = map['doseDown'];
  }

  String toJson() => json.encode(toMap());

  factory Rack.fromJson(String source) => Rack.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rack(idTouro: $idTouro, tipo: $tipo, volume: $volume, doseUP: $doseUP, doseDown: $doseDown)';
  }
}
