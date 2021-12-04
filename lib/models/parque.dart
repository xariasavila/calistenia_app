class Parque {
  final int idparque;
  final String nombre;
  //final String direccion;
  final String latitud;
  final String longitud;
  final String descripcion;

  Parque({
    required this.idparque,
    required this.nombre,
    //required this.direccion,
    required this.descripcion,
    required this.latitud,
    required this.longitud,
  });

  factory Parque.fromJson(Map<String, dynamic> json) {
    return Parque(
        idparque: json['idparque'] as int,
        nombre: json['nombre'] as String,
        //direccion: json['direccion'] as String,
        descripcion: json['descripcion'] as String,
        latitud: json['latitud'] as String,
        longitud: json['longitud'] as String);
  }

  Map<String, dynamic> toJson() => {
        'idparque': idparque,
        'nombre': nombre,
        'descripcion': descripcion,
        'latitud': latitud,
        'longitud': longitud
      };
}
