import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eba/views/info/info_common.dart';

class ReproductiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          ...buildHeader('reproductor', 55.0, () {
            Logger().d('Going back from Reproductive System Screen - On screen back button');
            Navigator.pop(context);
          }),
          Expanded(
              flex: 3,
              child: ListView(
                padding: const EdgeInsets.all(14.0),
                children: [
                  ...buildText('Además de brindarnos leche, una vaca cumple con '
                      'albergar a la cría que extenderá su linaje, y con ello '
                      'garantizar el futuro de la especie.',
                    textAlign: TextAlign.center,
                    fontFamily: 'Canda Tawa Regular',
                    fontSize: 28.0,
                    height: 1.2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('images/reproductive-system.png'),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildText('El sistema está constituido por los '
                            'órganos internos y externos.\nLos primeros incluyen '
                            '2 ovarios, 2 oviductos, 2 cuernos uterinos, un '
                            'útero, el cérvix y la vagina, mientras que los '
                            'segundos son el vestíbulo vaginal y la vulva.',
                          textAlign: TextAlign.right,
                        )[0],
                      ),
                    ],
                  ),
                  ...buildText('La vejiga se encuentra bajo todo el aparato '
                      'reproductor y está conectada a la apertura uretral en la '
                      'base de la vagina, mientras que el recto está ubicado '
                      'por encima.',
                    dividerColor: Color(0xffaad4aa),
                  ),
                  ...buildText('Las enfermedades reproductivas son silenciosas '
                      'porque el ganado no suele presentar síntomas visibles, '
                      'aunque puede ser positivo a una de ellas.',
                    textAlign: TextAlign.center,
                  ),
                  ...buildBoxedText('La rinotraqueitis infecciosa, IBR; la '
                      'leptospirosis endémica, la diarrea viral bovina, DVB; la '
                      'neosporosis, la tricomoniasis y campilobacteriosis son '
                      'las 5 patologías que más afectan a los bovinos desde la '
                      'gestación hasta el nacimiento de la cría. ',
                    fontFamily: 'Canda Tawa Regular',
                    fontSize: 28.0,
                    height: 1.2,
                  ),
                  ...buildText('Estas enfermedades se pueden identificar con '
                      'diagnóstico o cuando el ganadero observa que sus reses '
                      'no logran quedar en estado de gestación o presentan '
                      'abortos. Por ello es importante tener un esquema de '
                      'prevención con el que se evitará la disminución del hato '
                      'y con esto la producción láctea, teniendo en cuenta la '
                      'debida vacunación de los bovinos.'),
                  ...buildText('Además, al igual que muchos seres vivos, las '
                      'vacas solo producen leche luego del parto para alimentar '
                      'a su cría y parto tras parto su producción láctea varía, '
                      'por esto se debe tener especial control y cuidado, ya que '
                      'enfermedades como la mastitis pueden aparecer en vacas '
                      'por diversos factores como dejar sobras del lácteo en la '
                      'ubre, esto ocurre por un ordeño inadecuado y no establecer '
                      'diariamente horarios fijos para extraer el líquido. ',
                    dividerColor:  Color(0xffaad4aa),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
