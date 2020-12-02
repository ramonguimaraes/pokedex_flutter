import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/constants.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';

class PokemonRepositories {
  Future<PokemonModel> getPokemon(int id) async {
    final response = await http.get("$BASEURL/pokemon/$id");

    return PokemonModel.fromJson(jsonDecode(response.body));
  }

  Future<List<PokemonListItem>> getAll({int limit = 20, int offset = 0}) async {
    final response =
        await http.get("$BASEURL/pokemon/?limit=$limit&offset=$offset");

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return (responseJson["results"] as List)
        .map((element) => PokemonListItem.fromJson(element))
        .toList();
  }

  Future<int> getMaxPokemons() async {
    final response = await http.get("$BASEURL/pokemon/?limit=1&offset=1");
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    return responseJson["count"];
  }
}
