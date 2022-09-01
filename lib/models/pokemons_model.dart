class PokemonModel {
  final id;
  final name;
  final imgUrl;
  final selected;
  final answer;

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
