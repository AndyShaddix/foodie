import 'package:flutter/material.dart';
//Pantallas
import 'package:foodie/src/pages/bienvenida_pantalla.dart';
import 'package:foodie/src/pages/login_page.dart';
import 'package:foodie/src/pages/recuperarpass_page.dart';

import '../pages/crearcuenta_page.dart';

final routes = <String, WidgetBuilder>{
  'bienvenida': (BuildContext context) => PaginaBienvenida(),
  'login': (BuildContext context) => LoginPage(),
  'forpass': (BuildContext context) => RecuperarPass(),
  'registrarse': (BuildContext context) => SignUp(),
};
