//Libreria a importar para usar los materiales de Dart.
import 'package:flutter/material.dart';

/*Aqui le estamos dando estilos perzonalizados a un boton al que podre llamar en
en las distintas pantallas de nuestro proyecto.*/
final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(400, 70),
  backgroundColor: const Color.fromARGB(255, 247, 196, 31),
  elevation: 0,
  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
  textStyle:
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);

final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
    minimumSize: const Size(400, 70),
    backgroundColor: const Color.fromARGB(255, 5, 87, 15),
    elevation: 0,
    textStyle: TextStyle(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ));
