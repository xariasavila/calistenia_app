class Noticias {
  final int idnoticia;
  final String titulo;
  final DateTime fecha;
  final String descripcion;

  const Noticias(
      {required this.idnoticia,
      required this.titulo,
      required this.fecha,
      required this.descripcion});

  factory Noticias.fromJson(Map<String, dynamic> json) => Noticias(
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
