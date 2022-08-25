import 'package:flutter/material.dart';
import 'package:pokequizz/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int getRandomNum() {
    int randomNum = Random().nextInt(151);
    return randomNum;
  }

  @override
  void initState() {
    context.read<PokemonNotifier>().getPokemonDataFromApi(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PokeQuizz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${context.watch<PokemonNotifier>().pokemonModel?.name}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
