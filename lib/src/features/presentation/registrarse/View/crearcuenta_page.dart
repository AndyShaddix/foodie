// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//Colores propios
import '../../../../colors/colors.dart';
//Botones propios
import '../../../../styles/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController pass = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  registroUsuario() async {
    try {
      if (nombre.text.isEmpty ||
          apellido.text.isEmpty ||
          correo.text.isEmpty ||
          numero.text.isEmpty ||
          pass.text.isEmpty) {
        Navigator.pushNamed(context, 'registrarse');
        _mostrarAlerta(context, 'assets/formulario.png', "ATENCIÓN",
            "Los campos no pueden estar vacíos.\n Favor de completar sus datos.");
      } else {
        CollectionReference ref =
            FirebaseFirestore.instance.collection('Users');
        QuerySnapshot usuario = await ref.get();
        if (usuario.docs.isNotEmpty) {
          for (var cursor in usuario.docs) {
            if (cursor.get('Email') == correo.text) {
              print('Usuario ya registrado');
              Navigator.pushNamed(context, 'registrarse');
              String rutaImagen = 'assets/backdata.png';
              String titulo = "ATENCIÓN";
              String texto =
                  "Ya existe un registro con el mismo correo electrónico.\n Inicia sesión o registrate con uno diferente.";
              _mostrarAlerta(context, rutaImagen, titulo, texto);
            } else {
              await firebase.collection('Users').doc().set({
                "Nombre": nombre.text,
                "Apellido": apellido.text,
                "Email": correo.text,
                "Numero": numero.text,
                "Password": pass.text,
                "Estado": 0,
              });
              print('Registro exitoso');
              Navigator.pushNamed(context, 'login');
            }
          }
        } else {
          await firebase.collection('Users').doc().set({
            "Nombre": nombre.text,
            "Apellido": apellido.text,
            "Email": correo.text,
            "Numero": numero.text,
            "Password": pass.text,
            "Estado": 0,
          });
          print('Registro exitoso');
          Navigator.pushNamed(context, 'login');
        }
      }
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('Error......' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (BuildContext context) {
            return _btnBack(context, Colors.black);
          }),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text('Crear una cuenta',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                _userName(context, nombre),
                _lastName(context, apellido),
                _emailTextfield(context, correo),
                _phoneTextfield(context, numero),
                _passwordTextfield(context, pass),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    registroUsuario();
                  },
                  child: const Text('Registrarse'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: const Text(
                    "Dando click en 'Registrarse' estas aceptando nuestros términos y condiciones.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

//Boton de retroceso
Widget _btnBack(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_rounded,
      color: color,
      size: 50.0,
    ),
    onPressed: () {
      Navigator.pushNamed(context, 'login');
    },
  );
}

//Campo de entrada usuario
Widget _userName(BuildContext context, TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: "Nombre",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _lastName(BuildContext context, TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          hintText: "Apellido",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada email
Widget _emailTextfield(BuildContext context, TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: "Correo electrónico",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada numero de telefono
Widget _phoneTextfield(BuildContext context, TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
          hintText: "Número de teléfono",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada password
Widget _passwordTextfield(BuildContext context, TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: "Contraseña",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

void _mostrarAlerta(
    BuildContext context, String rutaImg, String header, String warning) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          // ignore: sized_box_for_whitespace
          content: Container(
            height: 400,
            child: Column(
              children: [
                Image(image: AssetImage(rutaImg), width: 130, height: 130),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Text(header,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Text(warning,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 5, 87, 15),
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0)),
                ),
                const SizedBox(height: 40.0),
                _btnHecho(context)
              ],
            ),
          ),
        );
      });
}

Widget _btnHecho(BuildContext context) {
  return ElevatedButton(
    style: buttonSecondary,
    onPressed: () {
      Navigator.pushNamed(context, 'registrarse');
    },
    child: const Text('Hecho'),
  );
}
