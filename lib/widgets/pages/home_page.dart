import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';
import 'package:pokedex_flutter/repository/pokemon_repositories.dart';
import 'package:pokedex_flutter/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PokemonRepositories pokemonRepositories = new PokemonRepositories();
  List<PokemonListItem> pokemonList = [];
  int limit = 100;
  int max = 0;

  loadPokemons() {
    pokemonRepositories.getMaxPokemons().then((value) => max = value);
    pokemonRepositories.getAll(limit: limit).then((value) {
      setState(() {
        pokemonList = value;
      });
    });
  }

  @override
  void initState() {
    loadPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Text("Pokemons"),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: pokemonList.length + 1,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (ctx, index) {
                if (pokemonList.length > index) {
                  return CustomCard(pokemonList[index]);
                } else {
                  if (pokemonList.length == max) {
                    return null;
                  }

                  limit += 100;
                  loadPokemons();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
