import 'dart:async';
import 'package:calistenia_app/models/book.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //SlidingCardController controller ;
  List<Book> books = [];
  late Future<Book> futureBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('CALISTENIA APP'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: 10,
        ),
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  color: Colors.orange,
                  child: Text(
                    "Bienvenido!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.orange,
                child: Text(
                  "Proximos Eventos!",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              colorCard("FECHA 2", 35.170, 1, context, Color(0xFF1b5bff)),
              colorCard("FECHA 1", 4320, -1, context, Color(0xFFff3f5e)),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Noticias",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          vaweCard(
            context,
            "Earned",
            200,
            1,
            Colors.grey.shade100,
            Color(0xFF716cff),
          ),
          vaweCard(
            context,
            "Spent",
            3210,
            -1,
            Colors.grey.shade100,
            Color(0xFFff596b),
          ),
        ],
      ),
    );
  }

  Widget vaweCard(BuildContext context, String name, double amount, int type,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text(
                "80%",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

Widget newsCard(Book book, Size size) {
  return Stack(
    children: <Widget>[
      Container(
        child: Image.network(book.urlImage, fit: BoxFit.cover),
        height: size.height / 2.0,
      ),
    ],
  );
}

/*
Widget buildPage(BuildContext context, int direction) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: FutureBuilder<Book>(
            future: futureBook,

          builder: (context, snapshot) {
          if (snapshot.hasData) {
                            return newsCard(snapshot.data.size);

        
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
      },
    ),
    );
  }

 

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
      );*/
      

