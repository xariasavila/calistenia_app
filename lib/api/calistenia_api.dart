import 'dart:convert';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:calistenia_app/models/evento.dart';
import 'package:calistenia_app/models/noticia.dart';
import 'package:http/http.dart' as http;

class CalisteniaApi {
  // GET EJERCICIOS FACILES
  static Future<List<Ejercicio>> getEjercicios1(String query) async {
    final url =
        Uri.parse('http://67.205.155.156:4500/api/ejerciciodificultad/1');
    final response = await http.get(url);

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
    final url =
        Uri.parse('http://67.205.155.156:4500/api/ejerciciodificultad/2');
    final response = await http.get(url);

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
    final url =
        Uri.parse('http://67.205.155.156:4500/api/ejerciciodificultad/3');
    final response = await http.get(url);

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

// GET NOTICIAS
  static Future<List<Noticia>> getNoticias(String query) async {
    final url = Uri.parse('http://67.205.155.156:4500/api/noticia');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List noticias = json.decode(response.body);

      return noticias.map((json) => Noticia.fromJson(json)).where((noticia) {
        final tituloLower = noticia.titulo.toLowerCase();
        final descripcionLower = noticia.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return tituloLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

// GET EVENTOS
  static Future<List<Evento>> getEventos(String query) async {
    final url = Uri.parse('http://67.205.155.156:4500/api/evento');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List eventos = json.decode(response.body);

      return eventos.map((json) => Evento.fromJson(json)).where((evento) {
        final nombreLower = evento.nombre.toLowerCase();
        final descripcionLower = evento.descripcion.toLowerCase();
        final searchLower = query.toLowerCase();

        return nombreLower.contains(searchLower) ||
            descripcionLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}





/*  static Future<List<Ejercicio>> getEjerciciosDificultad(
      int idDificultad) async {
    final url = Uri.parse(
        'http://67.205.155.156:4500/api/ejercicio/dificultad/' +
            idDificultad.toString());

    //BACKEND DE ALEX String query = "select * from ejercicio where id_dificultad="+idDificultad.toString();

    final response = await http.get(url);

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
*/