import 'dart:convert';
import 'package:flutter/material.dart';

class Pokemon {

  String index = '';
  String name;
  String url_img;

  Pokemon({this.index, this.name, this.url_img});

  String toString() {
    return 'Name: ${ this.name } - Img: ${ this.url_img } ';
  }

  static Future<List<Pokemon>> getListFromJson(BuildContext context) async {

    String jsonString = await DefaultAssetBundle.of(context).loadString("lib/source/pokemons.json");

    // Map<String, dynamic> data = jsonDecode(jsonString);
    // print(' ${ _data[ 'results' ][ this.idx ] } ');

    List<Pokemon> _pokemons = new List<Pokemon>();
    List<dynamic> data = jsonDecode(jsonString)['results'];
    for (var i = 0; i < data.length; i++) {
      Pokemon pokemon = new Pokemon();
      pokemon.name = data[i]['name'];
      pokemon.url_img = data[i]['sprites']['animated'];
      _pokemons.add(pokemon);
    }

    return _pokemons;

  }

  static List<Pokemon> getListStatic() {

    List<Pokemon> pokemons = new List<Pokemon>();

    Pokemon p1 = new Pokemon();
    p1.index = '001';
    p1.name = 'Bulbasaur';
    p1.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png';
    pokemons.add(p1);

    Pokemon p2 = new Pokemon();
    p2.index = '002';
    p2.name = 'Ivysaur';
    p2.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png';
    pokemons.add(p2);

    Pokemon p3 = new Pokemon();
    p3.index = '003';
    p3.name = 'Venusaur';
    p3.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png';
    pokemons.add(p3);

    Pokemon p4 = new Pokemon();
    p4.index = '004';
    p4.name = 'Charmander';
    p4.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png';
    pokemons.add(p4);

    Pokemon p5 = new Pokemon();
    p5.index = '005';
    p5.name = 'Charmeleon';
    p5.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png';
    pokemons.add(p5);

    Pokemon p6 = new Pokemon();
    p6.index = '006';
    p6.name = 'Charizard';
    p6.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png';
    pokemons.add(p6);

    Pokemon p7 = new Pokemon();
    p7.index = '007';
    p7.name = 'Charmander';
    p7.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png';
    pokemons.add(p7);

    Pokemon p8 = new Pokemon();
    p8.index = '008';
    p8.name = 'Charmeleon';
    p8.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png';
    pokemons.add(p8);

    Pokemon p9 = new Pokemon();
    p9.index = '009';
    p9.name = 'Charizard';
    p9.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png';
    pokemons.add(p9);

    Pokemon p10 = new Pokemon();
    p10.index = '007';
    p10.name = 'Caterpie';
    p10.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png';
    pokemons.add(p10);

    Pokemon p11 = new Pokemon();
    p11.index = '011';
    p11.name = 'Metapod';
    p11.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/011.png';
    pokemons.add(p11);

    Pokemon p12 = new Pokemon();
    p12.index = '012';
    p12.name = 'Butterfree';
    p12.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png';
    pokemons.add(p12);

    Pokemon p13 = new Pokemon();
    p13.index = '013';
    p13.name = 'Weedle';
    p13.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png';
    pokemons.add(p13);

    Pokemon p14 = new Pokemon();
    p14.index = '014';
    p14.name = 'Kakuna';
    p14.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png';
    pokemons.add(p14);

    Pokemon p15 = new Pokemon();
    p15.index = '015';
    p15.name = 'Beedrill';
    p15.url_img = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/015.png';
    pokemons.add(p15);

    return pokemons;

  }

}