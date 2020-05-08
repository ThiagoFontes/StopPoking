import 'package:flutter/material.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key key,
    @required this.name,
    @required this.pokedexNumber,
  }) : super(key: key);

  final String name;
  final int pokedexNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Text(
              (pokedexNumber).toString(),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
          ),
          Expanded(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
