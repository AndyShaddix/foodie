import 'package:flutter/material.dart';
//Colores propios
import '../colors/colors.dart';
//Botones propios
import '../styles/button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                _userName(context),
                _emailTextfield(context),
                _phoneTextfield(context),
                _birthTextField(context),
                _passwordTextfield(context),
                const SizedBox(height: 40),
                _btnRegistrarse(context),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: const Text(
                    "Dando click en 'Registrarse' estas aceptando los siguientes términos y condiciones.",
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
Widget _userName(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Nombre de usuario",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada email
Widget _emailTextfield(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Correo electrónico",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada numero de telefono
Widget _phoneTextfield(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "Número de teléfono",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada fecha de nacimiento
Widget _birthTextField(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: "Fecha de nacimiento",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Campo de entrada password
Widget _passwordTextfield(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        color: bgEntradas, borderRadius: BorderRadius.circular(40.0)),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña",
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

//Boton registrarse
Widget _btnRegistrarse(BuildContext context) {
  return ElevatedButton(
    style: buttonPrimary,
    onPressed: () {
      Navigator.pushNamed(context, '');
    },
    child: const Text('Registrarse'),
  );
}
