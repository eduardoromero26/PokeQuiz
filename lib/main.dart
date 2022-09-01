import 'package:flutter/material.dart';
import 'package:pokequizz/providers/pokemon_provider.dart';
import 'package:pokequizz/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PokemonNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xffffcc03), primarySwatch: Colors.amber),
      home: const MyHomePage(),
    );
  }
}
