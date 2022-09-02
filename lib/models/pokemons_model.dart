class PokemonModel {
  final id;
  final name;
  var imgUrl;
  final selected;
  bool answer;

  PokemonModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.selected,
      required this.answer});
}

class RoundModel {
  dynamic roundMap;

  RoundModel({
    required this.roundMap,
  });
}
