import 'package:flutter/material.dart';

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
                const Text('Crear una cuenta',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
              ],
            ),
          ),
        ));
  }
}

Widget _btnBack(BuildContext context, Color color) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 50.0,
    ),
    onPressed: () {
      Navigator.pushNamed(context, 'login');
    },
  );
}
