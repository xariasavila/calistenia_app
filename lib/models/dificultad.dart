class Dificultad {
  final int iddificultad;
  final String nombre;

  Dificultad({
    required this.iddificultad,
    required this.nombre,
  });

  factory Dificultad.fromJson(Map<String, dynamic> json) =>
      Dificultad(iddificultad: json['iddificultad'], nombre: json['nombre']);
}
