import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:beermaker/strings.dart';
import 'package:beermaker/calcul.dart';
import 'package:beermaker/recette.dart';

class Outils extends StatefulWidget {
  const Outils({super.key});

  @override
  State<Outils> createState() => _OutilsState();
}

class _OutilsState extends State<Outils> {
  final _formKey = GlobalKey<FormState>();
  double _litreBiere = 0;
  double _degres = 0;
  double _ebcGrain = 0;
  Column _result = Column();

  void envoye() {
    double malt = Calculs.calcMalt(_litreBiere, _degres);
    double brassage = Calculs.calcBrassage(malt);
    double rincage = Calculs.calcRincage(_litreBiere, brassage);
    double amerisant = Calculs.calcAmerisant(_litreBiere);
    double aromatique = _litreBiere;
    double levure = Calculs.calcLevure(_litreBiere);
    double mcu = Calculs.calcMcu(_ebcGrain, _litreBiere);
    double ebc = Calculs.calcEbc(mcu);
    double srm = Calculs.calcSrm(ebc);
    //String rgb = Recette._srmToRGB(srm);

  setState(() {
    _result = Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '${Strings.strmalt}$malt kg\n${Strings.strbrassage}$brassage L\n${Strings.strrincage}$rincage L\n${Strings.stramerisant}$amerisant g\n${Strings.straromatique}$aromatique g\n${Strings.strlevure}$levure g'
          ),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${Strings.strmcu}$mcu\n${Strings.strebc}$ebc\n${Strings.strsrm}$srm'
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            const SizedBox(
              height: 50,
              width: 200,
              //color: Color(int.parse(rgb)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                /*  Text(rgb,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                  ), */
                ],
              ),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.all(20)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
  });

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Strings.texteButton2),
          ],
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(Strings.strvolBiere),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (biere) {
                    if (biere == null || biere.isEmpty) {
                      return Strings.strerreur;
                    } else {
                      _litreBiere = double.parse(biere.toString());
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(Strings.strdegres),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (degres) {
                    if (degres == null || degres.isEmpty) {
                      return Strings.strerreur;
                    } else {
                      _degres = double.parse(degres.toString());
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(Strings.strebcGrains),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (ebc) {
                    if (ebc == null || ebc.isEmpty) {
                      return Strings.strerreur;
                    } else {
                      _ebcGrain = double.parse(ebc.toString());
                    }
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    envoye();
                  }
                },
                child: const Text(Strings.strenvoye),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              _result,
            ],
          ),
        ),
      ),
    );
  }
  

}