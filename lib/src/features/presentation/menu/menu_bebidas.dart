import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/src/colors/colors.dart';
import 'package:foodie/src/features/presentation/widgets/encabezados.dart';

// ignore: camel_case_types
class MenuBebida extends StatefulWidget {
  const MenuBebida({super.key});

  @override
  State<MenuBebida> createState() => _MenuBebidaState();
}

class _MenuBebidaState extends State<MenuBebida> {
  final _foodStream =
      FirebaseFirestore.instance.collection('Bebidas').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
            stream: _foodStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("ConnectionError");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }
              var docs = snapshot.data!.docs;
              return ListView.builder(
                padding: const EdgeInsets.only(top: 125),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(docs[index]['rutaIMG'],
                              width: 150, height: 150, fit: BoxFit.cover),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              encabezado(
                                  docs[index]['nombre'], Colors.black, 20.0),
                              const SizedBox(
                                height: 7.0,
                              ),
                              encabezado(
                                  'MXN ${docs[index]['precio']}', gris, 18.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 60, left: 20.0),
              child: encabezado('Bebidas', Colors.black, 50.0)),
        ],
      ),
    );
  }
}
