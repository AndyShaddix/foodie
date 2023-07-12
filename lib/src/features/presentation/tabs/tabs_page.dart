import 'package:flutter/material.dart';
import 'package:foodie/src/features/presentation/tabs/profile_tab.dart';
//Importando las 'Pages' tab.
import 'explore_tab.dart';
import 'fav_tab.dart';
import 'order_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  //Arreglo de objetos.
  final List<Widget> _widgetOptions = [
    const ExplorarTab(),
    const MiOrden(),
    const Favoritos(),
    const PerfilUser()
  ];
  //declaracion variable tipo entero para jugar con los indices del arreglo.
  int _selectedItem = 0;

  void _cambioWidget(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItem),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItem,
        onTap: _cambioWidget,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Menú  ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_rounded),
            label: 'Mi orden',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt_rounded),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          ),
        ]);
  }
}
