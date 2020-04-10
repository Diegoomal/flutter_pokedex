import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class DataSearch extends SearchDelegate<String> {

  // final cities = [ 'charmander', 'pikachu', 'squirtle', 'bubasauro' ];
  // final recentCities = [ 'mogi', 'suzano' ];

  List<String> itens = new List<String>();
  List<String> recentItens = new List<String>();
  List<String> suggestionList = new List<String>();
  List<Pokemon> pokemons = new List<Pokemon>();

  DataSearch(List<Pokemon> pokemons) {

    this.pokemons = pokemons;

    for (var i = 0; i < 12; i++) {
      Pokemon pokemon = pokemons[i];
      this.recentItens.add( pokemon.name );
    }

    for (Pokemon pokemon in pokemons) {
      this.itens.add( pokemon.name );
    }

  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // implement actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
      onPressed: () {
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection

    List<Pokemon> pokemonsResult = new List<Pokemon>();
    for (String suggestedPokmeon in suggestionList) {
      for (Pokemon pokemon in this.pokemons) {
        if(pokemon.name.startsWith(suggestedPokmeon)) {
          pokemonsResult.add(pokemon);
        }
      }
    }

    return GridView.count(
      crossAxisCount: 3,
      children:
        List.generate(pokemonsResult.length, (index) {
          return Container(
            child: PokemonCard(pokemon: pokemonsResult[index])
          );
        }
      )
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone seaches for something

    suggestionList = query.isEmpty ? recentItens : itens.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        onTap: () { showResults(context); },
        // title: Text(suggestionList[index])
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              ),
            ]
          ),
        ),
      ),
    );

  }



}