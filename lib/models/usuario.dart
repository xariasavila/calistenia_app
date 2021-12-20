class Usuario {
  final String idusuario;
  final String correo;
  final String password;
  final String perfil;

  Usuario({
    required this.idusuario,
    required this.correo,
    required this.password,
    required this.perfil,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idusuario: json['idusuario'],
        correo: json['correo'],
        password: json['password'],
        perfil: json['perfil'],
      );

  Map<String, dynamic> toJson() => {
        'idusuario': idusuario,
        'correo': correo,
        'password': password,
        'perfil': perfil
      };
}
