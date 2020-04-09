import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonCard extends StatelessWidget {

  final Pokemon pokemon;

  const PokemonCard({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () async { functionOnTap(context); },
        child: Container(
          child: Image.network(   this.pokemon.url_img, height: 150, width: 150   )
          // child: Text(  this.pokemon.name   ),
        )
      )
    );
  }

  void functionOnTap(BuildContext context) {
    print( pokemon.toString() );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Qual eh esse pokemon???"),
          content: new Text( pokemon.toString() ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () { Navigator.of(context).pop(); },
            ),
          ]
        );
      },
    );
  }

}