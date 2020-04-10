import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/widgets/searchbar.dart';

class ListPokemonPage extends StatefulWidget {
  
  final String title;
  
  ListPokemonPage({Key key, this.title}) : super(key: key);

  @override
  _ListPokemonPageState createState() => _ListPokemonPageState();

}

class _ListPokemonPageState extends State<ListPokemonPage> {

  List<Pokemon> pokemons = new List<Pokemon>();

  @override
  void initState() {
    
    super.initState();    
    
    // this.pokemons = Pokemon.getListStatic();

    Pokemon.getListFromJson(context).then( (_pokemons) => {
      setState(() {        
        this.pokemons = _pokemons;
      })
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      // appBar: AppBar(title: Text('Pokedex')),

      drawer: Drawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {
              showSearch(context: context, delegate: DataSearch(this.pokemons));
            }
          )
        ],
      ),





      body: GridView.count(
        crossAxisCount: 3,
        children:
          List.generate(this.pokemons.length, (index) {
            return Container(
              child: PokemonCard(pokemon: this.pokemons[index])
            );
          }
        )
      ),

      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //   onPressed: () => {
      //     print( this.pokemons[0].toString() )
      //   },
      // ),

    );
  }

}

