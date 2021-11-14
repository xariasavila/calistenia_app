class Noticia {
  final int idnoticia;
  final String titulo;
  final String fecha;
  final String descripcion;

  Noticia(
      {required this.idnoticia,
      required this.titulo,
      required this.fecha,
      required this.descripcion});

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
      idnoticia: json['idnoticia'],
      titulo: json['titulo'],
      fecha: json['fecha'],
      descripcion: json['descripcion']);

  Map<String, dynamic> toJson() => {
        'idnoticia': idnoticia,
        'titulo': titulo,
        'fecha': fecha,
        'descripcion': descripcion
      };
}
