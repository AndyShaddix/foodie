import 'package:flutter/material.dart';
import 'package:foodie/src/colors/colors.dart';
import 'package:foodie/src/styles/button.dart';

class RecuperarPass extends StatelessWidget {
  const RecuperarPass({super.key});

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
            const Text('¿Olvidaste tu contraseña?',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0)),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  'Favor de introducir su correo electrónico. Recibira un link para restablecer su contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0)),
            ),
            _emailInput(),
            const SizedBox(height: 40),
            ElevatedButton(
              style: buttonPrimary,
              onPressed: () {
                _mostrarAlerta(context);
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      )),
    );
  }
}

//Crear entrada para el email
Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Lanzar alerta al usuario para actualizar la contraseña
void _mostrarAlerta(BuildContext context) {
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
                const Image(
                    image: AssetImage('assets/passRecovery.png'),
                    width: 130,
                    height: 130),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: const Text('Tu contraseña ha sido actualizada.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: const Text(
                      'Recibiras un email con un codigo para configurar tu nueva contraseña',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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

//Boton de entendido de la alerta
Widget _btnHecho(BuildContext context) {
  return ElevatedButton(
    style: buttonSecondary,
    onPressed: () {
      Navigator.pushNamed(context, 'login');
    },
    child: const Text('Hecho'),
  );
}

//Boton con icono de flecha de retroceso
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
