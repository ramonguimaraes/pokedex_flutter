import 'package:pokedex_flutter/constants.dart';

class PokemonListItem {
  String name;
  String url;

  String get pokemonId {
    final urlSplitted = url.split('/');
    final pokemonId = urlSplitted[urlSplitted.length - 2];

    return pokemonId;
  }

  String get spriteUrl {
    return "$SPRITEURL/$pokemonId.png";
  }

  PokemonListItem({this.name, this.url});

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PokemonListItem(
      name: json["name"],
      url: json["url"],
    );
  }
}
