class Eventos {
  final int idevento;
  final String nombre;
  final String fecha;
  final String hora;
  final String descripcion;
  final int idinstructor;

  Eventos({
    required this.idevento,
    required this.nombre,
    required this.fecha,
    required this.hora,
    required this.descripcion,
    required this.idinstructor,
  });

  factory Eventos.fromJson(Map<String, dynamic> json) {
    return Eventos(
      idevento: json['idevento'],
      nombre: json['nombre'],
      fecha: json['fecha'],
      hora: json['hora'],
      descripcion: json['descripcion'],
      idinstructor: json['idinstructor'],
    );
  }
}
