import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:eba/views/unity_screen.dart';
import 'package:eba/views/info/info_common.dart';

class GeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff363839),
        body: WillPopScope(
          onWillPop: () {
            Logger().d('Going back from General Info Screen - OS back action');
            Navigator.pushNamed(
              context,
              '/unity-screen',
              arguments: UnityArguments(UnityModel.GENERAL),
            );
            return Future.value(true);
          },
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: buildExtendedHeader(() {
                  Logger().d('Going back from General Info Screen - On screen back button');
                  Navigator.pushNamed(
                    context,
                    '/unity-screen',
                    arguments: UnityArguments(UnityModel.GENERAL),
                  );
                })
              ),
              buildHeaderDivider(),
              Expanded(
                flex: 15,
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    padding: const EdgeInsets.all(14.0),
                    children: [
                      buildTitle(),
                      ...buildText('Estos colores son característicos para que me '
                          'reconozcas, algunas veces también puede ser rojizo con '
                          'blanco.',
                        fontFamily: 'Canda Tawa Regular',
                        textAlign: TextAlign.center,
                        fontSize: 28.0,
                        height: 1.2,
                      ),
                      ...buildText('Nací en Ubaté, conocida como la capital '
                          'lechera de Colombia, pero mis ancestros eran de Holanda, '
                          'mi raza es originaria de Europa. Allá se realizó un '
                          'proceso de cruzamientos, del cual resultaron nuestras '
                          'características únicas de color, fortaleza y producción, '
                          'que comenzaron a diferenciarnos de las demás razas. Por '
                          'ejemplo, la producción promedio de una vaca Holstein '
                          'en la región, es de más de 100.000 litros diarios y '
                          'cada año aumenta un poco más.'),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          buildBoxedText('Seguro has preparado un delicioso\n'
                              'café o chocolate en casa para\n'
                              'degustar en el día o has\n'
                              'consumido algún producto\n'
                              'derivado de nuestra leche,\n'
                              'a estos se les denomina\n'
                              'productos lácteos. ',
                            textAlign: TextAlign.right,
                            alignment: Alignment.centerRight,
                          )[0],
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                                  child: Image.asset('images/diary-products.png'),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ...buildBoxedText('Para elaborarlos se somete la leche a '
                          'ciertas condiciones que hacen que este alimento se '
                          'transforme en otro diferente, pues sus características '
                          'nutricionales y organolépticas son distintas, las '
                          'propiedades organolépticas son todas aquellas descripciones '
                          'de las características físicas que tiene la materia en '
                          'general, según las pueden percibir los sentidos, como '
                          'por ejemplo su sabor, textura, olor, color o temperatura. '
                          'Estos procesos de elaboración pueden ser llevados a '
                          'cabo por la fermentación de microorganismos como '
                          'bacterias u hongos.',
                        textAlign: TextAlign.left,
                      ),
                      ...buildText('La leche contiene una gran proporción de grasas '
                          'y proteínas. Por esta razón, todos los productos lácteos '
                          'derivados de la leche tienen una composición similar, '
                          'pero hay diferencias. Por ejemplo, los productos '
                          'fermentados contienen menos lactosa que la leche, pues '
                          'este azúcar ha sido consumido por algún microorganismo.',
                          dividerColor: Color(0xffaad4aa),
                      ),
                      ...buildText('Aquí te enumero unos cuantos productos '
                          'lácteos deliciosos e insignias en la región:'),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: buildText('•Queso en todos sus tipos.\n'
                                    '•Yogurt de muchos sabores.\n'
                                    '•Kumis.\n'
                                    '•Cuajada.\n'
                                    '•Nata o crema de leche.\n'
                                    '•Arequipe.\n'
                                    '•Mantequilla.\n',
                                  fontFamily: 'Canda Tawa Regular',
                                  fontSize: 25.0,
                                  height: 1.2,
                                )[0],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 7,
                                child: Image.asset('images/diary-fridge.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ...buildText('Las demás vacas de mi raza también viven en '
                          'climas parecidos a este, en donde no se alcanzan '
                          'temperaturas muy altas, nos gusta mucho el pasto y cuando '
                          'estamos sanas podemos recostarnos en él para comer por '
                          'largos periodos de tiempo, puesto que somos rumiantes.',
                        dividerColor: Color(0xffaad4aa),
                      ),
                      ...buildText('Además, somos animales elegantes y grandes. '
                          'Un ternero Holstein saludable pesa 40 Kg. o más al '
                          'nacimiento. Una vaca madura llega a pesar unos 675 Kg. '
                          'Con una altura a la cruz de unos 150 cm.'),
                      buildText('Recuerda cuidarnos siempre y tratarnos con amor.',
                        fontFamily: 'Canda Tawa Regular',
                        textAlign: TextAlign.center,
                        fontSize: 35.0,
                        height: 1.2,
                      )[0],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTitle() => Row(
  children: [
    Expanded(
      flex: 1,
      child: Image.asset('images/left-black-stain.png'),
    ),
    Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.center,
        child: buildText('¿Ves mis manchas\nblancas y negras?',
          fontSize: 25.0,
        )[0],
      ),
    ),
    Expanded(
      flex: 1,
      child: Image.asset('images/right-black-stain.png'),
    ),
  ],
);

Widget buildExtendedHeader(Function backButtonAction) {
  Widget baseHeader = buildHeader('soy Eba.', 72.0, backButtonAction, topText: 'Hola,');
  Widget extendedBackground = Row(
    children: [
      Expanded(
        flex: 5,
        child: Container(),
      ),
      Expanded(
        flex: 1,
        child: Container(
          child: Image.asset('images/middle-spilled-milk.png'),
          alignment: Alignment.topRight,
        ),
      ),
    ],
  );
  Widget extraRow = Container(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Soy una\nvaca Holstein.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Canda Tawa Regular',
                    color: Colors.white,
                    fontSize: 45.0,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ]
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('images/standing-cow.png')
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ],
    ),
  );
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Stack(
          children: [
            extendedBackground,
            baseHeader,
          ]
        ),
      ),
      Expanded(
        flex: 1,
        child: extraRow,
      ),
    ],
  );
}