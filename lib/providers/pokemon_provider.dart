import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokequizz/services/pokemon_service.dart';

import '../models/pokemons_model.dart';

class PokemonNotifier extends ChangeNotifier {
  final searchPokemons = SearchPokemonDataServices();
  PokemonModel? pokemonModel1;
  PokemonModel? pokemonModel2;
  PokemonModel? pokemonModel3;
  PokemonModel? pokemonModel4;
  PokemonModel? pokemonModel5;
  RoundModel? roundModel;
  var loading = true;

  Future getPokemonDataFromApi() async {
    var numWinner = Random().nextInt(4);
    pokemonModel5 = PokemonModel(
        id: 0, name: 'winner', imgUrl: '', selected: true, answer: true);
    //Pokemon 1
    dynamic PokemonData = await searchPokemons.getPokemonDataFromApi();
    if (PokemonData != null) {
      pokemonModel1 = PokemonModel(
          id: 1,
          name: PokemonData['name'],
          imgUrl: PokemonData['sprites']['front_default'],
          selected: false,
          answer: false);
    }
    if (pokemonModel1?.id == numWinner) {
      pokemonModel1?.answer = true;
      pokemonModel5?.imgUrl = pokemonModel1?.imgUrl;
    }

    //Pokemon 2
    PokemonData = await searchPokemons.getPokemonDataFromApi();
    if (PokemonData != null) {
      pokemonModel2 = PokemonModel(
          id: 2,
          name: PokemonData['name'],
          imgUrl: PokemonData['sprites']['front_default'],
          selected: false,
          answer: false);
    }
    if (pokemonModel2?.id == numWinner) {
      pokemonModel2?.answer = true;
      pokemonModel5?.imgUrl = pokemonModel2?.imgUrl;
    }

    //Pokemon 3
    PokemonData = await searchPokemons.getPokemonDataFromApi();
    if (PokemonData != null) {
      pokemonModel3 = PokemonModel(
          id: 3,
          name: PokemonData['name'],
          imgUrl: PokemonData['sprites']['front_default'],
          selected: false,
          answer: false);
    }
    if (pokemonModel3?.id == numWinner) {
      pokemonModel3?.answer = true;
      pokemonModel5?.imgUrl = pokemonModel3?.imgUrl;
    }

    //Pokemon 4
    PokemonData = await searchPokemons.getPokemonDataFromApi();
    if (PokemonData != null) {
      pokemonModel4 = PokemonModel(
          id: 4,
          name: PokemonData['name'],
          imgUrl: PokemonData['sprites']['front_default'],
          selected: false,
          answer: false);
    }
    if (pokemonModel4?.id == numWinner) {
      pokemonModel4?.answer = true;
      pokemonModel5?.imgUrl = pokemonModel4?.imgUrl;
    }

    loading = false;
    notifyListeners();
  }
}
