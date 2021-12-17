import 'dart:convert';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:calistenia_app/models/evento.dart';
import 'package:calistenia_app/models/noticia.dart';
import 'package:calistenia_app/models/parque.dart';
import 'package:calistenia_app/models/rutina.dart';
import 'package:http/http.dart' as http;

class CalisteniaApi {
  // GET EJERCICIOS FACILES
  static Future<List<Ejercicio>> getEjercicios1(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/ejerciciodificultad/717592914781765633');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List ejercicios = json.decode(response.body);

      return ejercicios
          .map((json) => Ejercicio.fromJson(json))
          .where((ejercicio) {
        final nombreLower = ejercicio.nombre.toLowerCase();
        final descripcionLower = ejercicio.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // GET EJERCICIOS INTERMEDIOS
  static Future<List<Ejercicio>> getEjercicios2(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/ejerciciodificultad/717592934008586241');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List ejercicios = json.decode(response.body);

      return ejercicios
          .map((json) => Ejercicio.fromJson(json))
          .where((ejercicio) {
        final nombreLower = ejercicio.nombre.toLowerCase();
        final descripcionLower = ejercicio.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // GET EJERCICIOS AVANZADOS
  static Future<List<Ejercicio>> getEjercicios3(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/ejerciciodificultad/717592951292395521');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List ejercicios = json.decode(response.body);

      return ejercicios
          .map((json) => Ejercicio.fromJson(json))
          .where((ejercicio) {
        final nombreLower = ejercicio.nombre.toLowerCase();
        final descripcionLower = ejercicio.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // GET RUTINA FACIL
  static Future<List<Rutina>> getRutinas1(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/rutinadificultad/717592914781765633');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List rutinas = json.decode(response.body);

      return rutinas.map((json) => Rutina.fromJson(json)).where((rutina) {
        final nombreLower = rutina.nombre.toLowerCase();
        final descripcionLower = rutina.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // GET RUTINA INTERMEDIOS
  static Future<List<Rutina>> getRutinas2(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/rutinadificultad/717592934008586241');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List rutinas = json.decode(response.body);

      return rutinas.map((json) => Rutina.fromJson(json)).where((rutina) {
        final nombreLower = rutina.nombre.toLowerCase();
        final descripcionLower = rutina.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // GET RUTINA AVANZADOS
  static Future<List<Rutina>> getRutinas3(String query) async {
    var url = Uri.parse(
        'http://back-calistenia.herokuapp.com/api/rutinadificultad/717592951292395521');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List rutinas = json.decode(response.body);

      return rutinas.map((json) => Rutina.fromJson(json)).where((rutina) {
        final nombreLower = rutina.nombre.toLowerCase();
        final descripcionLower = rutina.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

// GET NOTICIAS
  static Future<List<Noticia>> getNoticias(String query) async {
    var url = Uri.parse('https://back-calistenia.herokuapp.com/api/noticia');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List noticias = json.decode(response.body);

      return noticias.map((json) => Noticia.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

// GET EVENTOS
  static Future<List<Evento>> getEventos(String query) async {
    var url = Uri.parse('https://back-calistenia.herokuapp.com/api/evento');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List eventos = json.decode(response.body);

      return eventos.map((json) => Evento.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}

// GET PARQUES
Future<List<Parque>> getParques2(String query) async {
  var url = Uri.parse('https://back-calistenia.herokuapp.com/api/parque');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final List parques = json.decode(response.body);

    return parques.map((json) => Parque.fromJson(json)).toList();
  } else {
    throw Exception();
  }
}

/*
//get usuarios
Future<List<Usuario>> getUsuarios(String query) async {
  final url = Uri.parse('https://back-calistenia.herokuapp.com/api/usuario');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List usuarios = json.decode(response.body);

    return usuarios.map((json) => Usuario.fromJson(json)).toList();
  } else {
    throw Exception();
  }
}*/
