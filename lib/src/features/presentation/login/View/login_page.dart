// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/src/colors/colors.dart';
//Importando la libreria de mi boton personalizado en la clase de estilos
import 'package:foodie/src/styles/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black));
    TextEditingController correo = TextEditingController();
    TextEditingController pass = TextEditingController();
    final firebase = FirebaseFirestore.instance;
    verificarDatos() async {
      try {
        CollectionReference ref =
            FirebaseFirestore.instance.collection('Users');
        QuerySnapshot usuario = await ref.get();
        if (usuario.docs.isNotEmpty) {
          for (var cursor in usuario.docs) {
            if (cursor.get('Email') == correo.text) {
              print('Usuario encontrado');
              print(cursor.get('Email'));
              if (cursor.get('Password') == pass.text) {
                print('Registro exitoso');
                print('Acceso aceptado');
                await firebase.collection('Users').doc(cursor.id).update({
                  "Estado": 1,
                });
                Navigator.pushNamed(context, 'menu');
              } else {
                String rutaImagen = 'assets/passRecovery.png';
                String titulo = "Inicio de sesion no permitido";
                String texto =
                    "Alguno de los campos ingresados es incorrecto.\nFavor de verificar sus datos.";
                _mostrarAlerta(context, rutaImagen, titulo, texto);
                break;
              }
            }
          }
        } else {
          print('Usuario no encontrado');
          String rutaImagen = 'assets/registrate.png';
          String titulo = "Usuario no registrado";
          String texto =
              "Usuario no registrado.\nFavor de verificar sus datos o crear una cuenta.";
          _mostrarAlerta(context, rutaImagen, titulo, texto);
          print('No hay documentos');
        }
      } catch (e) {
        print('Error' + e.toString());
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                width: double.infinity,
                height: 400.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/LoginPage.jpg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60.0),
                child: _btnBack(context, Colors.black),
              )
            ],
          ),
          Transform.translate(
            offset: const Offset(0.0, -50.0),
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text('Bienvenidos',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0)),
                      const SizedBox(height: 20.0),
                      const Text('Iniciar Sesión',
                          style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0)),
                      _emailInput(correo),
                      _passwordInput(pass),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () async {
                          verificarDatos();
                        },
                        child: const Text('Entrar'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'forpass');
                          },
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿No tienes una cuenta?',
                                style: TextStyle(
                                    color: gris,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'registrarse');
                              },
                              child: const Text(' Registrate',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 247, 196, 31),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Campo de entrada email
Widget _emailInput(TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada password
Widget _passwordInput(TextEditingController control) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextField(
      controller: control,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
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
      Navigator.pushNamed(context, 'bienvenida');
    },
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
      Navigator.pop(context, 'login');
    },
    child: const Text('Hecho'),
  );
}
