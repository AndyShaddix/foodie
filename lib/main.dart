import 'package:flutter/material.dart';
import 'package:foodie/src/colors/colors.dart';
import 'package:foodie/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: 'bienvenida',
        theme: ThemeData(
            primaryColor: amarillo,
            disabledColor: gris,
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBarTheme: const AppBarTheme(
                iconTheme:
                    IconThemeData(color: Color.fromARGB(255, 255, 255, 255))),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.greenAccent)));
  }
}
