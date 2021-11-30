class Parque {
  final int idparque;
  final String nombre;
  final String direccion;
  final double latitud;
  final double longitud;
  final String descripcion;

  Parque({
    required this.idparque,
    required this.nombre,
    required this.direccion,
    required this.descripcion,
    required this.latitud,
    required this.longitud,
  });

  factory Parque.fromJson(Map<String, dynamic> json) => Parque(
      idparque: json['idparque'] as int,
      nombre: json['nombre'] as String,
      direccion: json['direccion'] as String,
      descripcion: json['descripcion'] as String,
      latitud: json['latitud'] as double,
      longitud: json['longitud'] as double);

  Map<String, dynamic> toJson() => {
        'idparque': idparque,
        'nombre': nombre,
        'direccion': direccion,
        'descripcion': descripcion,
        'latitud': latitud,
        'longitud': longitud,
      };
}
