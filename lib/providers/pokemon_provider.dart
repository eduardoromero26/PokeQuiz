import 'package:flutter/material.dart';
import 'package:pokequizz/services/pokemon_service.dart';

import '../models/pokemons_model.dart';

class PokemonNotifier extends ChangeNotifier {
  final searchPokemons = SearchPokemonDataServices();
  PokemonModel? pokemonModel;

  Future getPokemonDataFromApi(numPokemon) async {
    dynamic PokemonData =
        await searchPokemons.getPokemonDataFromApi(numPokemon);

    if (PokemonData != null) {
      pokemonModel = PokemonModel(
          id: PokemonData,
          name: PokemonData['name'],
          imgUrl: PokemonData,
          selected: PokemonData,
          answer: PokemonData);
    }
    notifyListeners();
  }
}
