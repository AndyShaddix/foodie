import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hola Mundo:)'),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }
}

Widget _bottomNavBar(BuildContext context) {
  return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Mi orden',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Perfil',
        ),
      ]);
}
