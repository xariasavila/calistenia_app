class Parque {
  final String idparque;
  final String nombre;
  final double latitud;
  final double longitud;
  final String descripcion;

  Parque({
    required this.idparque,
    required this.nombre,
    required this.descripcion,
    required this.latitud,
    required this.longitud,
  });

  factory Parque.fromJson(Map<String, dynamic> json) {
    return Parque(
        idparque: json['idparque'] as String,
        nombre: json['nombre'] as String,
        descripcion: json['descripcion'] as String,
        latitud: json['latitud'] as double,
        longitud: json['longitud'] as double);
  }

  Map<String, dynamic> toJson() => {
        'idparque': idparque,
        'nombre': nombre,
        'descripcion': descripcion,
        'latitud': latitud,
        'longitud': longitud
      };
}
