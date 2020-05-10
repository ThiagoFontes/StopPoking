import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget(
      {Key key, @required message, @required retryFunction, icon})
      : _message = message,
        _retryFunction = retryFunction,
        _icon = icon,
        super(key: key);

  final String _message;
  final Function _retryFunction;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _retryFunction,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              Icon(
                _icon != null ? _icon : Icons.error_outline,
                color: Colors.red[200],
                size: 50,
              ),
              Text(_message),
              Text('Retry?'),
            ],
          ),
        ),
      ),
    );
  }
}
