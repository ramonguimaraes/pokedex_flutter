import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';
import 'package:pokedex_flutter/repository/pokemon_repositories.dart';
import 'package:pokedex_flutter/widgets/pages/details_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  PokemonListItem _pokemonListItem;
  CustomCard(this._pokemonListItem);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  PokemonRepositories _pokemonRepositories = new PokemonRepositories();
  PokemonModel _pokemonModel = new PokemonModel();

  loadPokemon() {
    _pokemonRepositories
        .getPokemon(int.parse(widget._pokemonListItem.pokemonId))
        .then(
      (value) {
        _pokemonModel = value;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailsPage(_pokemonModel),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return GestureDetector(
          onTap: () {
            loadPokemon();
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("${widget._pokemonListItem.pokemonId}"),
                    ],
                  ),
                  SizedBox(
                    width: constrains.maxWidth / 1.6,
                    child: Image.network(
                      widget._pokemonListItem.spriteUrl,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text("${widget._pokemonListItem.name}")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
