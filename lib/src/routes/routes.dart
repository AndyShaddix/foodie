import 'package:flutter/material.dart';
//Pantallas
import 'package:foodie/src/features/presentation/bienvenida/View/bienvenida_pantalla.dart';
import 'package:foodie/src/features/presentation/login/View/login_page.dart';
import 'package:foodie/src/features/presentation/recuperarpass/View/recuperarpass_page.dart';
import '../features/presentation/registrarse/View/crearcuenta_page.dart';
import '../features/presentation/tabs/tabs_page.dart';

final routes = <String, WidgetBuilder>{
  'bienvenida': (BuildContext context) => const PaginaBienvenida(),
  'login': (BuildContext context) => const LoginPage(),
  'forpass': (BuildContext context) => const RecuperarPass(),
  'registrarse': (BuildContext context) => const SignUp(),
  'menu': (BuildContext context) => const TabsPage(),
};
