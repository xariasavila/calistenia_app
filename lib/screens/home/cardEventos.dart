import 'dart:async';
import 'dart:convert';
import 'package:calistenia_app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardEventos extends StatefulWidget {
  @override
  CardEventosState createState() => CardEventosState();
}

class CardEventosState extends State<CardEventos> {
  late Future<Book> futureBook;

  List<Book> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    futureBook = fetchEvento();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildBook(Book book) => ListTile(
        leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.title),
        subtitle: Text(book.author),
        trailing: Icon(Icons.arrow_forward),
        /*  onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                 // builder: (context) => DetalleEjercicio(book.id)));
          //debugPrint('id: $book.id');
        },*/
      );
}

Future<Book> fetchEvento() async {
  final response = await http.get(Uri.parse(
      'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Book.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
