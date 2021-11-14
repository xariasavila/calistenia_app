class Ejercicio {
  final int idejercicio;
  final String nombre;
  final String descripcion;
  final String link;
  final int iddificultad;

  const Ejercicio({
    required this.idejercicio,
    required this.nombre,
    required this.descripcion,
    required this.link,
    required this.iddificultad,
  });

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        idejercicio: json['idejercicio'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        link: json['link'],
        iddificultad: json['iddificultad'],
      );

  Map<String, dynamic> toJson() => {
        'idejercicio': idejercicio,
        'nombre': nombre,
        'descripcion': descripcion,
        'link': link,
        'iddificultad': iddificultad,
      };
}
