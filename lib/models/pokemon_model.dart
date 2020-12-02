import 'package:pokedex_flutter/constants.dart';

class PokemonModel {
  int id;
  String pokemonName = "";
  int hp = 0;
  int attack = 0;
  int defense = 0;
  int specialAttack = 0;
  int specialDefense = 0;
  int speed = 0;
  String spriteUrl = "";

  PokemonModel({
    this.id,
    this.pokemonName,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.spriteUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json["id"],
      pokemonName: json["name"],
      hp: json["stats"][0]["base_stat"],
      attack: json["stats"][1]["base_stat"],
      defense: json["stats"][2]["base_stat"],
      specialAttack: json["stats"][3]["base_stat"],
      specialDefense: json["stats"][4]["base_stat"],
      speed: json["stats"][5]["base_stat"],
      spriteUrl: "$SPRITEURL${json["id"]}.png",
    );
  }
}
