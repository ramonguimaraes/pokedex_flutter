import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';
import 'package:pokedex_flutter/widgets/custom_progress_bar.dart';
import 'package:pokedex_flutter/widgets/pages/home_page.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  PokemonModel _pokemonModel;

  DetailsPage(this._pokemonModel);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  PokemonModel pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = widget._pokemonModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: constraints.maxHeight / 2,
                    color: Colors.white,
                  ),
                  Container(
                    height: constraints.maxHeight / 2,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[300],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: constraints.maxHeight / 11,
                child: Container(
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth / 1.5,
                        child: Image.network(pokemon.spriteUrl),
                      ),
                      Text(
                        widget._pokemonModel.pokemonName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      CustomProgressBar(
                        "HP",
                        constraints.maxWidth / 1.5,
                        pokemon.hp,
                      ),
                      CustomProgressBar(
                        "ATK",
                        constraints.maxWidth / 1.5,
                        pokemon.attack,
                      ),
                      CustomProgressBar(
                        "DEF",
                        constraints.maxWidth / 1.5,
                        pokemon.defense,
                      ),
                      CustomProgressBar(
                        "SATK",
                        constraints.maxWidth / 1.5,
                        pokemon.specialAttack,
                      ),
                      CustomProgressBar(
                        "SDEF",
                        constraints.maxWidth / 1.5,
                        pokemon.specialDefense,
                      ),
                      CustomProgressBar(
                        "SPD",
                        constraints.maxWidth / 1.5,
                        pokemon.speed,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
