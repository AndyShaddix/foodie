import 'package:flutter/material.dart';
import 'package:foodie/src/styles/button.dart';

void _mostrarAlerta(BuildContext context, String rutaImg, String header,
    String warning, String route) {
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
                _btnHecho(context, route)
              ],
            ),
          ),
        );
      });
}

Widget _btnHecho(BuildContext context, ruta) {
  return ElevatedButton(
    style: buttonSecondary,
    onPressed: () {
      Navigator.pushNamed(context, ruta);
    },
    child: const Text('Hecho'),
  );
}
