class Ejercicio {
  final String idejercicio;
  final String nombre;
  final String descripcion;
  final String link;
  final String iddificultad;
  // final Dificultad dificultade;

  Ejercicio({
    required this.idejercicio,
    required this.nombre,
    required this.descripcion,
    required this.link,
    required this.iddificultad,
    //  required this.dificultade
  });

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
      idejercicio: json['idejercicio'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      link: json['link'],
      iddificultad: json['iddificultad']
      //   dificultade: json['dificultade'],
      );
}
