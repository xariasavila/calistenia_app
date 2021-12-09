class Noticia {
  final String idnoticia;
  final String titulo;
  final String fecha;
  final String descripcion;
  final String createdAt;

  Noticia({
    required this.idnoticia,
    required this.titulo,
    required this.fecha,
    required this.descripcion,
    required this.createdAt,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
      idnoticia: json['idnoticia'] as String,
      titulo: json['titulo'] as String,
      fecha: json['fecha'] as String,
      descripcion: json['descripcion'] as String,
      createdAt: json['createdAt'] as String);

  Map<String, dynamic> toJson() => {
        'idnoticia': idnoticia,
        'titulo': titulo,
        'fecha': fecha,
        'descripcion': descripcion,
        'createdAt': createdAt,
      };
}
