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

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                width: double.infinity,
                height: 500.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/LoginPage.jpg'),
                /*image: NetworkImage(
                      'https://cocogrill.net/wp-content/uploads/2021/03/recetas-para-hacer-burritos-de-carne-asada-cocogrill.jpg')*/
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
                      Text('Iniciar Sesión',
                          style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0)),
                      _emailInput(),
                      _passwordInput(),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () {
                          Navigator.pushNamed(context, 'menu');
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
                            Text('¿No tienes una cuenta?',
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

//Campo de entrada password
Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
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
