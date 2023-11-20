import 'package:beermaker/strings.dart';
import 'package:flutter/material.dart';

class Etape extends StatefulWidget {
  const Etape({super.key});

  @override
  State<Etape> createState() => _EtapeState();
}

class _EtapeState extends State<Etape> {
  int _nbEtape = 0;
  String _titre = Strings.titre0;
  String _text = Strings.texte0;

  void decrement() {
    if (_nbEtape > 0) {
      _nbEtape--;
      page();
    }
  }

  void increment() {
    if (_nbEtape < 8) {
      _nbEtape++;
      page();
    }
  }

  IconButton _btnAvant() {
    IconButton result = const IconButton(onPressed: null, icon: Icon(null));
    if (_nbEtape != 0) {
      result = IconButton(
        onPressed: decrement,
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
        ));
    }
    return result;
  }

  IconButton _btnApres() {
    IconButton result = const IconButton(onPressed: null, icon: Icon(null));
    if (_nbEtape != 8) {
      result = IconButton(
        onPressed: increment,
        icon: const Icon(
          Icons.arrow_forward,
          size: 25,
        ));
    }
    return result;
  }

  void page() {
    setState(() {
      switch(_nbEtape) {
        case 0:
        _titre = Strings.titre0;
        _text = Strings.texte0;
        break;
        case 1:
        _titre = Strings.titre1;
        _text = Strings.texte1;
        break;
        case 2:
        _titre = Strings.titre2;
        _text = Strings.texte2;
        break;
        case 3:
        _titre = Strings.titre3;
        _text = Strings.texte3;
        break;
        case 4:
        _titre = Strings.titre4;
        _text = Strings.texte4;
        break;
        case 5:
        _titre = Strings.titre5;
        _text = Strings.texte5;
        break;
        case 6:
        _titre = Strings.titre6;
        _text = Strings.texte6;
        break;
        case 7:
        _titre = Strings.titre7;
        _text = Strings.texte7;
        break;
        case 8:
        _titre = Strings.titre8;
        _text = Strings.texte8;
        break;
      }
    });
  }

/*
  @override
  void initState() {
    super.initState();
  }


  var titreStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  var textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w200);
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(Strings.texteButton1),
              ],
            )
          ],
        ),
      ),
      body:  Center(
        child: Column(
          children: [
            Text(_titre,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.all(10)),
            Text(_text),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _btnAvant(),
            _btnApres()
          ],
        ),
      ),
    );
  }

/*
  _titre() {
    if (nbEtape == 0) {
      return Text(
        Strings.titre0,
        style: titreStyle,
      );
    } else if (nbEtape == 1) {
      return Text(
        '1. ${Strings.titre1}',
        style: titreStyle,
      );
    } else if (nbEtape == 2) {
      return Text(
        '2. ${Strings.titre2}',
        style: titreStyle,
      );
    } else if (nbEtape == 3) {
      return Text(
        '3. ${Strings.titre3}',
        style: titreStyle,
      );
    } else if (nbEtape == 4) {
      return Text(
        '4. ${Strings.titre4}',
        style: titreStyle,
      );
    } else if (nbEtape == 5) {
      return Text(
        '5. ${Strings.titre5}',
        style: titreStyle,
      );
    } else if (nbEtape == 6) {
      return Text(
        '6. ${Strings.titre6}',
        style: titreStyle,
      );
    } else if (nbEtape == 7) {
      return Text(
        '7. ${Strings.titre7}',
        style: titreStyle,
      );
    }
  }

  _text() {
    if (nbEtape == 0) {
      return Text(
        Strings.texte0,
        style: textStyle,
      );
    } else if (nbEtape == 1) {
      return Text(
        Strings.texte1,
        style: textStyle,
      );
    } else if (nbEtape == 2) {
      return Text(
        Strings.texte2,
        style: textStyle,
      );
    } else if (nbEtape == 3) {
      return Text(
        Strings.texte3,
        style: textStyle,
      );
    } else if (nbEtape == 4) {
      return Text(
        Strings.texte4,
        style: textStyle,
      );
    } else if (nbEtape == 5) {
      return Text(
        Strings.texte5,
        style: textStyle,
      );
    } else if (nbEtape == 6) {
      return Text(
        Strings.texte6,
        style: textStyle,
      );
    } else if (nbEtape == 7) {
      return Text(
        Strings.texte7,
        style: textStyle,
      );
    }
  }

*/



  


/*
  Widget _textContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 450,
          width: 350,
          color: Colors.red,
          child: SingleChildScrollView(child: _text()),
        )
      ],
    );
  }
*/
  /* Widget _info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _btnAvant(),
        _textContainer(),
        _btnApres(),
      ],
    );
  }

  */
}
