import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
//Importando la libreria de mi boton personalizado en la clase de estilos
import 'package:foodie/src/styles/button.dart';
import '../../../../../auth_google.dart';

class PaginaBienvenida extends StatefulWidget {
  const PaginaBienvenida({super.key});

  @override
  State<PaginaBienvenida> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<PaginaBienvenida> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    Firebase.initializeApp();
    return Scaffold(
      body: Stack(
        children: [
          //Es el estilo del container del background
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/WelcomeBG.jpeg'),
/*Imagen desde internet.
image: NetworkImage('https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg')*/
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 30.0),
                child: Image.asset('assets/my-Logo.png'),
              ),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: buttonSecondary,
                onPressed: () async {
                  User? user = await Authenticator.iniciarSesion(context);
                  print(user?.displayName);
                  if (user != null) {
                    Navigator.pushNamed(context, 'menu');
                  }
                },
                icon: Image.asset('assets/google512px.png', scale: 25),
                label: const Text('Entrar con Google.'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
