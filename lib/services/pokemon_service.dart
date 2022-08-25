import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class SearchPokemonDataServices {
  Future<Map> getPokemonDataFromApi(NumPokemon) async {
    try {
      var resp = await http.get(
          Uri.parse('${Constants().baseUrl}/pokemon-form/$NumPokemon'),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          });
      var data = jsonDecode(resp.body);
      print(data);
      // Validations
      return data;
    } catch (e) {
      return {};
    }
  }
}
