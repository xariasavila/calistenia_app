import 'dart:ui';
import 'package:flutter/material.dart';
import '../mainscreen.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' Iniciar Sesion',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ubuntu'),
              )),
          SizedBox(
            height: 5,
          ),
          TextFieldContainer(
            child: TextField(
              onChanged: (value) {},
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
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
                hintText: 'Rut Alumno',
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
            child: TextField(
              obscureText: _isHidden,
              onChanged: (value) {},
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
            elevation: 2.0,
            fillColor: Colors.redAccent.withOpacity(0.3),
            child: Text(
              'Entrenar',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.6,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu'),
            ),
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(color: Colors.black.withOpacity(0.5), width: 2),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recuperar contraseña',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
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
