import 'package:flutter/material.dart';
import 'package:presentation/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appTitle = 'Stop Poking';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: _appTitle,
        key: Key('Home Screen Key'),
      ),
    );
  }
}
