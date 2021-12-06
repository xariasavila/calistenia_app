class Usuario {
  final int idusuario;
  final String correo;
  final String password;

  Usuario({
    required this.idusuario,
    required this.correo,
    required this.password,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idusuario: json['idusuario'],
        correo: json['correo'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() =>
      {'idusuario': idusuario, 'correo': correo, 'password': password};
}
