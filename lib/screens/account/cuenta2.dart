import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cuenta2 extends StatefulWidget {
  Cuenta2({Key? key}) : super(key: key);

  @override
  _Cuenta2State createState() => _Cuenta2State();
}

class _Cuenta2State extends State<Cuenta2> {
  String nombreUsuario = 'Xaviera Arias';
  bool _isHidden = true;
  final ImagePicker _picker = ImagePicker();
  File? image;
  String? _imagepath;

  void initState() {
    super.initState();
    loadImage(context);
  }

  /*Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();

    final name = basename(imagePath);

    final image = File("${directory.path}/$name");

    return File(imagePath).copy(image.path);
  }
*/
  /* Future<String> getFilePath() async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

    return filePath;
  }

  void saveFile(BuildContext context) async {
    File image = File(await getFilePath()); // 1
    image.writeAsString(
        "This is my demo text that will be saved to : demoTextFile.txt"); // 2
  }

  void readFile() async {
    File image = File(await getFilePath()); // 1
    String fileContent = await image.readAsString(); // 2

    print('File Content: $fileContent');
  }

*/
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("CUENTA"),
      ),
      body: ListView(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: avatar(context),
          padding: const EdgeInsets.all(8.0),
          // color: Colors.black,
        ),
        Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Text('$nombreUsuario', style: TextStyle(fontSize: 40)),
            ])),
        SizedBox(
          height: 20,
        ),
        formulario(context),
      ]),
    );
  }

  Widget formulario(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(right: 50, left: 50),
          child: TextField(
            obscureText: _isHidden,
            onChanged: (value) {},
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              filled: true,
              labelText: 'Nueva contraseña',
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              //  controller: _actualizaController,
            ),
          )),

      SizedBox(
        height: 16,
      ),
      Container(
          margin: const EdgeInsets.only(right: 50, left: 50),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              filled: true,
              labelText: 'Confirmar contraseña',
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _isHidden ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            obscureText: true,
          )),
// spacer
      SizedBox(height: 50.0),

      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.orange),
        child: Text('Guardar', style: TextStyle(fontSize: 20)),
        onPressed: () {
          saveImage(_imagepath);
          //  _actualizaController.clear();
          // _confirmaController.clear();
        },
      )
    ]);
  }

  Widget avatar(BuildContext context) {
    // if (image == null) {
    return Center(
        child: Stack(children: <Widget>[
      image != null
          ? CircleAvatar(
              backgroundImage: FileImage(File(image!.path)),

              //         backgroundImage: FileImage(File(_imagepath.toString())),
              radius: 80,
            )
          : CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/rutinas.jpg")
              // :FileImage(File(image!.path))
              ),
      Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.orange,
                size: 28,
              ))),
    ]));
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Seleccionar foto",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                abrirCamara(context);
              },
              label: Text("Camara"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                abrirGaleria(context);
              },
              label: Text("Galeria"),
            ),
          ])
        ],
      ),
    );
  }

  void abrirCamara(BuildContext context) async {
    final selectImageCamera =
        await _picker.pickImage(source: ImageSource.camera);

    print(selectImageCamera!.path.toString());

    setState(() {
      image = File(selectImageCamera.path);
    });

    Navigator.of(context).pop();
  }

  void abrirGaleria(BuildContext context) async {
    final selectImageGallery =
        await _picker.pickImage(source: ImageSource.gallery);

    print(selectImageGallery!.path.toString());

    setState(() {
      image = File(selectImageGallery.path);
      _imagepath = selectImageGallery.path;
    });

    Navigator.of(context).pop();
  }

  /* void abrirGaleria(BuildContext context) async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    print(selectImage!.path.toString());
    setState(() {
      image = selectImage;
    });
    Navigator.of(context).pop();
  }
*/
  void saveImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagePath", path);
  }

  void loadImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagePath");
    });
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
