import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/pokemon_list_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.sl}) : super(key: key);

  final String title;
  final GetIt sl;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocProvider(
        create: (_) => widget.sl<PokemonlistBloc>(),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 20,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      child: Text(
                        i.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                    ),
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 200,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
