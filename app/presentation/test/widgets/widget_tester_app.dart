import 'package:flutter/material.dart';

class WidgetTesterApp extends StatelessWidget {
  const WidgetTesterApp({
    Key key,
    @required child,
  })  : _widget = child,
        super(key: key);

  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widget,
      ),
    );
  }
}
