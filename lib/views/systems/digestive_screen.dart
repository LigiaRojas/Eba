import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

class DigestiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              color: Color(0xff363839),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              onPressed: () {
                                Logger().d('Going back from Digestive System Screen - On screen back button');
                                Navigator.pop(context);
                              },
                              child: Image.asset('images/left-arrow.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.only(top: 55.0),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Sistema',
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                color: Colors.white,
                                fontSize: 75.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'digestivo',
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                color: Colors.white,
                                fontSize: 75.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 6.0,
            height: 0.0,
            color: Color(0xffaad4aa),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              padding: const EdgeInsets.all(14.0),
              children: [
                ...buildStandardText('Los bovinos son rumiantes, animales que '
                    'digieren los alimentos en dos etapas: primero los consumen '
                    'y luego realizan la rumia, proceso que consiste en '
                    'regurgitar el material semidigerido y volverlo a masticar '
                    'para deshacerlo. Son conocidos por alimentarse de pasto o '
                    'forraje. La fisiología digestiva del rumiante tiene '
                    'características particulares por su capacidad de degradar '
                    'materiales que un estomago simple no podría hacer.'
                ),
                ...buildBoxedText('Los principales componentes del sistema '
                    'digestivo de los rumiantes son: la boca, la faringe, el '
                    'esófago, los pre-estómagos (retículo, rumen y omaso), el '
                    'abomaso, el intestino delgado, el intestino grueso y el '
                    'recto.'),
                Image.asset('images/digestive-system.gif'),
                buildDivider(),
                ...buildStandardText('Dedican cerca de ocho horas al día a la '
                    'ingestión de su alimentación. Aprisionan el alimento con '
                    'su lengua ágil y áspera, y sus incisivos inferiores les '
                    'permiten cortar la hierba contra su almohadilla dental; un '
                    'ligero movimiento de la cabeza hacia atrás facilita el '
                    'corte de la hierba. Durante la masticación, las glándulas '
                    'salivares producen la saliva para la preparación del bolo '
                    'alimenticio que a través del esófago se dirige hacia el '
                    'estómago. Un bovino da unos 40000 golpes de mandíbula al '
                    'día (10000 durante la toma de alimento y 30000 durante la '
                    'rumia).'
                ),
                ...buildStandardText('Una característica distintiva de los '
                    'rumiantes es su aparato digestivo poligástrico compuesto '
                    'por cuatro divisiones: tres preestómagos (el rumen o panza, '
                    'el retículo o redecilla y el omaso o libro) y por el '
                    'abomaso o estómago propiamente dicho; mediante la rumia y '
                    'la utilización de estas cuatro cámaras, el estómago de los '
                    'rumiantes es capaz de aprovechar los carbohidratos '
                    'estructurales presentes en las plantas (celulosa, '
                    'hemicelulosa y pectina).',
                  dividerColor: Color(0xffaad4aa),
                ),
                ...buildStandardText('El primer compartimiento por el que pasan '
                    'los alimentos es el rumen; a su entrada se encuentra un '
                    'repliegue de piel, el canal esofágico, que permite a la '
                    'leche en los jóvenes y al agua en los adultos pasar '
                    'directamente del esófago al omaso. El rumen es la cámara '
                    'de mayor tamaño, y representa cerca del 80% del volumen '
                    'total del estómago.',
                  dividerColor: Color(0xffaad4aa),
                ),
                ...buildStandardText('El retículo tiene como función la retención '
                    'de las partículas alimentarias y movilizar el alimento '
                    'digerido hacia el omaso o hacia el rumen en la regurgitación '
                    'del alimento después de la rumia. Las partículas más gruesas '
                    'son rechazadas hacia el rumen antes de ser masticadas otra '
                    'vez en el proceso de rumia. Las más finas pueden pasar '
                    'hacia el omaso.',
                  dividerColor: Color(0xffaad4aa),
                ),
                ...buildStandardText('El omaso está formado por finas láminas '
                    'parecidas en cierta forma a las hojas de un libro, de ahí '
                    'que también reciba el nombre de libro o librillo. Este '
                    'constituye una antecámara desde la cual pasa el bolo '
                    'alimenticio al abomaso, y es el encargado de la absorción '
                    'del exceso de agua contenida en los alimentos.',
                  dividerColor: Color(0xffaad4aa),
                ),
                ...buildStandardText('En el abomaso se segregan los jugos '
                    'gástricos que someten al alimento a la digestión '
                    'enzimática de las partículas alimentarias y de las '
                    'bacterias provenientes del rumen. El abomaso está conectado'
                    ' con el principio del intestino.',
                  dividerColor: Color(0xffaad4aa),
                ),
                ...buildStandardText('El intestino delgado se encarga de la '
                    'digestión y absorción de nutrientes, y ya en el intestino '
                    'grueso, el ciego se encarga de la fermentación de los '
                    'productos de digestión no absorbidos, el colon de la '
                    'absorción de agua y minerales, y el recto recibe los '
                    'materiales de desecho que quedan después de todo el proceso '
                    'de la digestión de los alimentos, constituyendo las heces '
                    'que serán expulsadas.'),
                ...buildBoxedText('Como dato adicional, existen enfermedades '
                    'como la cetosis, este es un trastorno que afecta a las '
                    'vacas en lactación. Al llamar la grasa corporal para ayudar '
                    'a satisfacer las necesidades energéticas de la producción '
                    'de leche, el sistema nervioso central puede llegar a ser '
                    'disfuncional, haciendo que las vacas tiendan a tropezar, '
                    'perder el apetito y se vuelven débiles.',
                  fontFamily: 'Canda Tawa Regular',
                  fontSize: 25.0,
                  height: 1.2
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

List<Widget> buildStandardText(String text, {Color dividerColor: Colors.white}) {
  return [
    Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontFamily: 'LeagueSpartan',
          color: Colors.black,
          fontSize: 18.0,
          height: 1.4
      ),
    ),
    buildDivider(color: dividerColor)
  ];
}

List<Widget> buildBoxedText(String text, { String fontFamily: 'LeagueSpartan', fontSize: 18.0, height: 1.4, Color dividerColor: Colors.white }) {
  return [
    Container(
      color: Color(0xffaad4aa),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: fontFamily,
            color: Colors.black,
            fontSize: fontSize,
            height: height
        ),
      ),
    ),
    buildDivider(color: dividerColor)
  ];
}

Divider buildDivider({ Color color: Colors.white }) => Divider(
  thickness: color == Colors.white ? 0.0 : 5.0,
  height: 20.0,
  color: color,
);
