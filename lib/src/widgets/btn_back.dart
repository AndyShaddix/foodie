import 'package:flutter/material.dart';

//Creando un boton de retroceso
Widget btnBack(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 50.0,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
