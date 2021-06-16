import 'package:flutter/material.dart';

import '../../constant.dart';

class Entrenamiento extends StatefulWidget {
  Entrenamiento({Key? key}) : super(key: key);

  @override
  _EntrenamientoState createState() => _EntrenamientoState();
}

class _EntrenamientoState extends State<Entrenamiento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: contentColorLightTheme,
          title: Text('Entrenamiento'),
        ),
        body: ListView(
          children: <Widget>[
            rutinaCard(),
            ejercicioCard(),
          ],
        ));
  }

  Widget rutinaCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTli_LVhmnmjGWtQ38i2nAGvyO4koa8WCifOg&usqp=CAU',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rutinas()),
                  );
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Rutinas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ],
        ),
      );

  Widget ejercicioCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://i0.wp.com/blog.alexdevero.com/wp-content/uploads/2016/02/CalisthenicsWhy-It-Is-The-Best-Hobby-post.jpg?fit=1024%2C576&ssl=1',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ejercicios()),
                  );
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Ejercicios',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ],
        ),
      );
}
