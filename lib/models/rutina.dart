class Rutina {
  // final int idrutina;
  final String nombre;
  final String descripcion;
  final String link;
  final String iddificultad;
  // final Dificultad dificultade;

  Rutina({
    // required this.idrutina,
    required this.nombre,
    required this.descripcion,
    required this.link,
    required this.iddificultad,
    //  required this.dificultade
  });

  factory Rutina.fromJson(Map<String, dynamic> json) => Rutina(
      //  idrutina: json['idrutina'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      link: json['link'],
      iddificultad: json['iddificultad']
      //   dificultade: json['dificultade'],
      );
}
