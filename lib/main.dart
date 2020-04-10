// 
// https://pokemon.gameinfo.io/pt-br/pokemon/003
// https://www.pokemon.com/br/pokedex/Ivysaur
// http://www.macoratti.net/19/07/flut_gridv1.htm
// https://stackoverflow.com/questions/48893935/how-to-remove-debug-banner-in-flutter-on-android-emulator
// https://github.com/joseluisq/pokemons
// https://flutter.institute/run-async-operation-on-widget-creation/
// 

import 'package:flutter/material.dart';
// import 'package:pokedex/pages/myhome.dart';
import 'package:pokedex/pages/list_pokemon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListPokemonPage(title: 'Flutter Pokedex'),
      debugShowCheckedModeBanner: false
    );
  }
}