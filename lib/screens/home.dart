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
  @override
  void initState() {
    context.read<PokemonNotifier>().getPokemonDataFromApi();
    super.initState();
  }

  getCorrectAnswer(nameSelected) {
    if (context.read<PokemonNotifier>().pokemonModel2?.answer == true &&
        nameSelected == context.read<PokemonNotifier>().pokemonModel2?.name) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Win"),
          content: Text("This pokemon is ${nameSelected}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Play Again",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Incorrect"),
          content: const Text("Try with another answer"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Try Again",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<PokemonNotifier>().loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pokemon_logo.png',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CircularProgressIndicator.adaptive(),
                ],
              ),
            )
          : _buildContent(),
    );
  }

  @override
  Widget _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeQuiz'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                context.watch<PokemonNotifier>().pokemonModel2?.imgUrl,
                scale: .5,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Who´s that Pokemon?',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              //firts button
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String pokemonSelected =
                        context.read<PokemonNotifier>().pokemonModel1?.name;
                    getCorrectAnswer(pokemonSelected);
                  },
                  child: Text(
                    '${context.watch<PokemonNotifier>().pokemonModel1?.name}',
                    style: const TextStyle(fontSize: 24, fontFamily: 'roboto'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //Second button
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String pokemonSelected =
                        context.read<PokemonNotifier>().pokemonModel2?.name;
                    getCorrectAnswer(pokemonSelected);
                  },
                  child: Text(
                    '${context.watch<PokemonNotifier>().pokemonModel2?.name}',
                    style: const TextStyle(fontSize: 24, fontFamily: 'roboto'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //Third Button
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String pokemonSelected =
                        context.read<PokemonNotifier>().pokemonModel3?.name;
                    getCorrectAnswer(pokemonSelected);
                  },
                  child: Text(
                    '${context.watch<PokemonNotifier>().pokemonModel3?.name}',
                    style: const TextStyle(fontSize: 24, fontFamily: 'roboto'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //fourth button
              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String pokemonSelected =
                        context.read<PokemonNotifier>().pokemonModel4?.name;
                    getCorrectAnswer(pokemonSelected);
                  },
                  child: Text(
                    '${context.watch<PokemonNotifier>().pokemonModel4?.name}',
                    style: const TextStyle(fontSize: 24, fontFamily: 'roboto'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
