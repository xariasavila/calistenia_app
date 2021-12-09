class Evento {
  final String idevento;
  final String nombre;
  final String fecha;
  //final String hora;
  final String descripcion;
  final int idinstructor;

  const Evento({
    required this.idevento,
    required this.nombre,
    required this.fecha,
    required this.descripcion,
    required this.idinstructor,
  });

  factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        idevento: json['idevento'],
        nombre: json['nombre'],
        fecha: json['fecha'],
        descripcion: json['descripcion'],
        idinstructor: json['idinstructor'],
      );

  Map<String, dynamic> toJson() => {
        'idevento': idevento,
        'nombre': nombre,
        'fecha': fecha,
        'descripcion': descripcion,
        'idinstructor': idinstructor,
      };
}
