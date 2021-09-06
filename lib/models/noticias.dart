class Noticias {
  Noticias({
    required this.idnoticia,
    required this.titulo,
    required this.fecha,
    required this.descripcion,
  });

  final int idnoticia;
  final String titulo;
  final DateTime fecha;
  final String descripcion;

  factory Noticias.fromJson(Map<String, dynamic> json) {
    return Noticias(
        idnoticia: json['idnoticia'],
        titulo: json['titulo'],
        fecha: json['fecha'],
        descripcion: json['descripcion']);
  }
}
