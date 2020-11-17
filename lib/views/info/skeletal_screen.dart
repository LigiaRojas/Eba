import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:eba/views/unity_screen.dart';
import 'package:eba/views/info/info_common.dart';

class SkeletalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff363839),
        body: WillPopScope(
          onWillPop: () {
            Logger().d('Going back from Skeletal System Screen - OS back action');
            Navigator.pushNamed(
              context,
              '/unity-screen',
              arguments: UnityArguments(UnityModel.SKELETAL),
            );
            return Future.value(true);
          },
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: buildHeader('óseo', 62.0, () {
                  Logger().d('Going back from Skeletal System Screen - On screen back button');
                  Navigator.pushNamed(
                    context,
                    '/unity-screen',
                    arguments: UnityArguments(UnityModel.SKELETAL),
                  );
                })
              ),
              buildHeaderDivider(),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      padding: const EdgeInsets.all(14.0),
                      children: [
                        Image.asset('images/skeletal-system.gif'),
                        ...buildBoxedText('La vaca tiene un total de 207 huesos. Los '
                            'huesos son órganos blanco-amarillentos que en conjunto '
                            'forman el sostén del organismo, las funciones básicas '
                            'del sistema óseo son:'),
                        ...buildText('•Soporte: los huesos proveen un cuadro '
                            'rígido de soporte para los músculos y tejidos blandos.',
                            textAlign: TextAlign.left,
                        ),
                        ...buildText('•Protección: los huesos forman varias cavidades que '
                            'protegen los órganos internos de posibles traumatismos. '
                            'Por ejemplo, el cráneo protege el cerebro frente a los '
                            'golpes, y la caja torácica, formada por costillas y '
                            'esternón protege los pulmones y el corazón.',
                            textAlign: TextAlign.left,
                        ),
                        ...buildText('•Movimiento: gracias a los músculos que se insertan en '
                            'los huesos a través de los tendones y su contracción '
                            'sincronizada, se produce el movimiento.',
                            textAlign: TextAlign.left,
                        ),
                        ...buildText('•Homeostasis mineral: el tejido óseo almacena una serie '
                            'de minerales, especialmente calcio y fósforo, necesarios '
                            'para la contracción muscular y otras muchas funciones. '
                            'Cuando son necesarios, el hueso libera dichos minerales '
                            'en la sangre que los distribuye a otras partes del '
                            'organismo.',
                            textAlign: TextAlign.left,
                        ),
                        ...buildText('•Producción de células sanguíneas: dentro de cavidades '
                            'situadas en ciertos huesos, un tejido conectivo '
                            'denominado médula ósea roja produce las células '
                            'sanguíneas rojas o hematíes mediante el proceso '
                            'denominado hematopoyesis.',
                          textAlign: TextAlign.left,
                          dividerColor: Color(0xffaad4aa),
                        ),
                        buildText('Los principales huesos bovinos son los siguientes:',
                          textAlign: TextAlign.center,
                        )[0],
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: buildText('•Radio\n'
                                    '•Esternón\n'
                                    '•Cúbito\n'
                                    '•Húmero\n'
                                    '•Omoplato\n'
                                    '•Cuenca del ojo\n',
                                  fontFamily: 'Canda Tawa Regular',
                                  fontSize: 28.0,
                                  height: 1.2,
                                )[0],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: buildText('•Vertebras\n'
                                    '•Cadera\n'
                                    '•Fémur\n'
                                    '•Costillas\n'
                                    '•Tibia\n',
                                  fontFamily: 'Canda Tawa Regular',
                                  fontSize: 28.0,
                                  height: 1.2,
                                )[0],
                              ),
                            ),
                          ],
                        ),
                        buildDivider(color: Color(0xffaad4aa)),
                        ...buildText('Muchas enfermedades y condiciones pueden ocurrir '
                            'dentro del esqueleto de una vaca si el sistema inmune '
                            'es débil o si está desnutrida. Por ejemplo, la fiebre '
                            'de leche o hipocalcemia es una condición que afecta '
                            'a las vacas cuando el calcio sale del torrente '
                            'sanguíneo para apoyar la producción de leche. El '
                            'resultado es una ruptura muscular y esquelética, que '
                            'debilita e incapacita al animal para ponerse de pie. Por '
                            'esto, las vacas deben ser bien alimentadas y se debe '
                            'prestar especial cuidado en su nutrición, teniendo en '
                            'cuenta una buena calcificación de sus huesos.'),
                        ...buildBoxedText('El ganado requiere numerosos minerales y '
                            'suplementos dietéticos para mantener su sistema '
                            'esquelético saludable y prevenir las condiciones de '
                            'quebrantos en su estructura ósea. Los minerales permiten '
                            'el mantenimiento normal corporal, el crecimiento y la '
                            'reproducción. ',
                          fontFamily: 'Canda Tawa Regular',
                          fontSize: 28.0,
                          height: 1.2,
                        ),
                        buildText('Los minerales principales necesarios en grandes '
                            'dosis para las vacas incluyen calcio, fósforo, magnesio, '
                            'potasio, sodio, cloro y azufre.\n'
                            'Y los minerales necesarios en dosis mucho más pequeñas '
                            'incluyen hierro, zinc, manganeso, cobre, yodo, cobalto y '
                            'selenio.',
                          textAlign: TextAlign.center,
                          dividerColor: Color(0xffaad4aa),
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
