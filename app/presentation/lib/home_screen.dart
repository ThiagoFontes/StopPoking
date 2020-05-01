import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pokemon_list_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.sl}) : super(key: key);

  final String title;
  final PokemonlistBloc sl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocProvider(
        create: (_) => sl,
        child: PokemonListWidget(),
      ),
    );
  }
}

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonlistBloc, PokemonlistState>(
      builder: (context, state) {
        if (state is EmptyState) {
          BlocProvider.of<PokemonlistBloc>(context)
              .add(GetFirstPageListOfPokemons());
          return Container();
        }
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Listing) {
          return ListView.builder(
            physics: ScrollPhysics(),
            itemCount: state.pokemonNameList.results.length,
            itemBuilder: (context, i) {
              var list = state.pokemonNameList.results;
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
                          (i + 1).toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Text(list[i].name),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
