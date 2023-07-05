import 'package:flutter/material.dart';
//Pantallas
import 'package:foodie/src/pages/bienvenida_pantalla.dart';
import 'package:foodie/src/pages/login_page.dart';
import 'package:foodie/src/pages/recuperarpass_page.dart';
import '../pages/crearcuenta_page.dart';
import '../tabs/tabs_page.dart';

final routes = <String, WidgetBuilder>{
  'bienvenida': (BuildContext context) => const PaginaBienvenida(),
  'login': (BuildContext context) => const LoginPage(),
  'forpass': (BuildContext context) => const RecuperarPass(),
  'registrarse': (BuildContext context) => const SignUp(),
  'menu': (BuildContext context) => const TabsPage(),
};
