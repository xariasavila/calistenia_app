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
      idnoticia: json['idnoticia'] as int,
      titulo: json['titulo'] as String,
      fecha: json['fecha'] as String,
      descripcion: json['descripcion'] as String);

  Map<String, dynamic> toJson() => {
        'idnoticia': idnoticia,
        'titulo': titulo,
        'fecha': fecha,
        'descripcion': descripcion
      };
}
