class Noticia {
  final String idnoticia;
  final String titulo;
  final String descripcion;
  final String createdAt;

  Noticia(
      {required this.idnoticia,
      required this.titulo,
      required this.descripcion,
      required this.createdAt});

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
      idnoticia: json['idnoticia'] as String,
      titulo: json['titulo'] as String,
      descripcion: json['descripcion'] as String,
      createdAt: json['createdAt'] as String);

  Map<String, dynamic> toJson() => {
        'idnoticia': idnoticia,
        'titulo': titulo,
        'descripcion': descripcion,
        'createdAt': createdAt
      };
}
