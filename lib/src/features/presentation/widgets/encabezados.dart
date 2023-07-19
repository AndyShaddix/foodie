import 'package:flutter/material.dart';

Widget encabezado(String texto, Color colorL, double tamano) {
  return Text(texto,
      style: TextStyle(
          color: colorL, fontWeight: FontWeight.bold, fontSize: tamano));
}
