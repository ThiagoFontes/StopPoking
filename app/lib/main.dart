import 'package:app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:presentation/screens.dart';

import 'injection_container.dart';

void main() {
  di.init();
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
        sl: sl,
        key: Key('Home Screen Key'),
      ),
    );
  }
}
