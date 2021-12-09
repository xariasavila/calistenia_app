import 'dart:convert';
import 'dart:ui';
import 'package:calistenia_app/screens/home/inicio.dart';
import 'package:calistenia_app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.4),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6.0,
                  sigmaY: 6.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.62,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.1),
                      )),
                  child: signUp(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding signUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'CALISTENIA CHILE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ubuntu'),
              )),
          SizedBox(
            height: 30,
          ),
          TextFieldContainer(
            child: TextFormField(
              controller: emailController,
              onChanged: (value) {
                if (value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Debe ingresar email")));
                }
                return null;
              },
              cursorColor: Colors.white,
              // keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Ubuntu'),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Correo Alumno',
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ubuntu'),
                border: InputBorder.none,
              ),
            ),
          ),
          //SizedBox(height: 5,),

          PasswordFieldContainer(
            child: TextFormField(
              controller: passController,
              obscureText: _isHidden,
              onChanged: (value) {
                if (value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Debe ingresar contraseña")));
                }
                return null;
              },
              cursorColor: Colors.white,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Ubuntu'),
              decoration: InputDecoration(
                hintText: "Contraseña",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ubuntu'),
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //Spacer(),
          RawMaterialButton(
            constraints: BoxConstraints(
                minHeight: 50,
                minWidth: MediaQuery.of(context).size.width * 0.8),
            onPressed: () {
              // login();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            elevation: 2.0,
            fillColor: Colors.orange[900],
            child: Text(
              'Entrenar',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.6,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu'),
            ),
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(color: Colors.black.withOpacity(0.5), width: 2),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://67.205.155.156:4500/api/usuario"),
          // Uri.parse('http://67.205.155.156:4500/api/usuario'),
          // headers: {'accept': 'application/json'},
          body: ({
            'correo': emailController.text,
            'password': passController.text
          }));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        print("login token" + body.toString());
        //print("login token" + response.toString());
        //  print("login token" + response.headers["token"].toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Inicio()));
      } else {
        print("invalid Credential");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Credenciales inválidas")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No está permitido")));
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class PasswordFieldContainer extends StatelessWidget {
  final Widget child;
  const PasswordFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

Widget titulo(context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(
          'CALISTENIA CHILE',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  ]);
}
