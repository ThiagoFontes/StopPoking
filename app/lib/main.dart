import 'package:flutter/material.dart';
import 'package:presentation/bloc/pokemon_list_bloc.dart';
import 'package:presentation/screens.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appTitle = 'Stop Poking';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.red.shade400,
      ),
      home: MyHomePage(
        title: _appTitle,
        key: Key('Home Screen Key'),
        sl: di.sl<PokemonlistBloc>(),
      ),
    );
  }
}
