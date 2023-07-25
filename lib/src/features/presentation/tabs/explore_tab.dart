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
    'https://mpda-project.000webhostapp.com/img/card1.jpeg',
    'https://mpda-project.000webhostapp.com/img/card6.jpg',
    'https://mpda-project.000webhostapp.com/img/card2.jpg',
    'https://mpda-project.000webhostapp.com/img/card3.jpg',
    'https://mpda-project.000webhostapp.com/img/card4.jpg',
    'https://mpda-project.000webhostapp.com/img/card5.jpg'
  ];
  final menuImages = const [
    'assets/comidas.png'
        'assets/bebidas.png'
        'assets/snacks.png'
        'assets/temporada.png'
  ];
  int aIndex = 0;
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
                    height: 500,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index)),
              ),
            ),
            const SizedBox(height: 12),
            buildIndicator(),
            const SizedBox(height: 12),
            _headers(context, 'Recomendados', 'Mostar más'),
            const SizedBox(height: 12),
            _populares(
                context,
                'https://mpda-project.000webhostapp.com/img/sandwich%20de%20pechuga.jpeg',
                "Sandwich de pechuga",
                r"MXN $55"),
            _populares(
                context,
                'https://mpda-project.000webhostapp.com/img/papas%20con%20boneless.jpeg',
                "Papas con boneless",
                r"MXN $70"),
            _populares(
                context,
                'https://mpda-project.000webhostapp.com/img/hamburguesa%20con%20papas.jpeg',
                "Hamburguesa con papas",
                r"MXN $80"),
            const SizedBox(height: 12),
            _headers(context, 'Menú', 'Mostar más'),
            const SizedBox(height: 12),
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

String _caseSubTexto(int index) {
  final precios = [
    r'MXN $55',
    r'MXN $55',
    r'MXN $30',
    r'MXN $30',
    r'MXN $55',
    r'MXN $25'
  ];
  String precio = precios[index];
  return precio;
}

String _caseTexto(int index) {
  final nombres = [
    'Ensalada',
    'Big Burro',
    'Quesadilla',
    'Sandwich',
    'Torta de asada',
    'Orden de papas'
  ];
  String nombre = nombres[index];
  return nombre;
}

Widget _buildImage(String pathImage, int index) => Container(
      //margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
                width: 380, height: 380, pathImage, fit: BoxFit.cover),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Text(
                  _caseTexto(index),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  alignment: Alignment.centerLeft,
                  child: encabezado(_caseSubTexto(index), gris, 17)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20.0)),
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  const Text(
                    "4.8",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 250.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(amarillo),
                        ),
                        onPressed: () {},
                        child: const Text('Comprar',
                            style: TextStyle(fontSize: 11.0))),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );

Widget _headers(BuildContext context, String textoHeader, String accionTexto) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15.0),
        alignment: Alignment.centerLeft,
        child: encabezado(textoHeader, Colors.black, 30.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              accionTexto,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            const Icon(Icons.play_arrow),
          ],
        ),
      ),
    ],
  );
}

Widget _populares(
    BuildContext context, String ruta, String nombre, String precio) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                image: NetworkImage(ruta),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: encabezado(nombre, Colors.black, 17.0),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      precio,
                      style: const TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: amarillo, size: 16.0),
                      const Text(
                        "4.0",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100.0),
                        width: 110.0,
                        height: 40.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(amarillo),
                            ),
                            onPressed: () {},
                            child: const Text('Comprar',
                                style: TextStyle(fontSize: 11.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}
