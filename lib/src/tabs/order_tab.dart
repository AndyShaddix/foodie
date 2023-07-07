import 'package:flutter/material.dart';

class MiOrden extends StatefulWidget {
  const MiOrden({super.key});

  @override
  State<MiOrden> createState() => _MiOrdenState();
}

class _MiOrdenState extends State<MiOrden> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Mi Orden'),
      ),
    );
  }
}
