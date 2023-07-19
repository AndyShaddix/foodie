import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../features//presentation/widgets/encabezados.dart';

class ExplorarTab extends StatefulWidget {
  const ExplorarTab({super.key});

  @override
  State<ExplorarTab> createState() => _ExplorarTabState();
}

class _ExplorarTabState extends State<ExplorarTab> {
  int activeIndex = 0;

  final assetsImages = const [
    'assets/card1.jpeg',
    'assets/LoginPage.jpg',
    'assets/card2.jpg',
    'assets/card3.jpg',
    'assets/card4.jpg',
    'assets/card5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
        const Padding(padding: EdgeInsets.only(top: 60.0)),
        _topBar(context),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          alignment: Alignment.centerLeft,
          child: encabezado("¿Que llevarás hoy?", Colors.black, 30.0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CarouselSlider.builder(
                itemCount: assetsImages.length,
                itemBuilder: (context, index, realIndex) {
                  final assetImage = assetsImages[index];
                  return _buildImage(assetImage, index);
                },
                options: CarouselOptions(
                    height: 430,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index)),
              ),
            ),
            const SizedBox(height: 12),
            buildIndicator()
          ],
        ),
      ])),
    ]));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: amarillo),
        activeIndex: activeIndex,
        count: assetsImages.length,
      );
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 475,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(50.0)),
        child: Row(children: [
          Icon(
            Icons.search,
            size: 45.0,
            color: gris,
          ),
          Text(
            'Buscar',
            style: TextStyle(color: gris, fontSize: 17.0),
          )
        ]),
      ),
    ],
  );
}

String _caseTexto(int index) {
  String nombre = "";
  switch (index) {
    case 0:
      nombre = "Ensalada";
      break; // The switch statement must be told to exit, or it will execute every case.
    case 1:
      nombre = "Big Burro";
      break;
    case 2:
      nombre = "Quesadilla";
      break;
    case 3:
      nombre = "Sandwich";
      break;
    case 4:
      nombre = "Torta de asada";
      break;
    case 5:
      nombre = "Orden de papas";
      break;
  }
  return nombre;
}

Widget _buildImage(String pathImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
                width: 380, height: 380, pathImage, fit: BoxFit.cover),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _caseTexto(index),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              )
            ],
          )
        ],
      ),
    );
