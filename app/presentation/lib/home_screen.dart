import 'package:domain/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pokemon_list_bloc.dart';
import 'widgets/pokemon_list_widget.dart';
import 'widgets/show_error_widget.dart';

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
        child: HomeContentWidget(),
      ),
    );
  }
}

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({
    Key key,
  }) : super(key: key);

  @override
  _HomeContentWidgetState createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  final ScrollController _scrollController = ScrollController();
  String url;
  List<PokemonNameItemEntity> currentPokemonNameList;

  @override
  void initState() {
    super.initState();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter <= 500) {
      BlocProvider.of<PokemonlistBloc>(context).add(
        GetPagedListOfPokemons(
          url: url,
          currentPokemonNameList: currentPokemonNameList,
        ),
      );
    }
    return false;
  }

  void _retry() {
    BlocProvider.of<PokemonlistBloc>(context).add(
      GetPagedListOfPokemons(
        url: url,
        currentPokemonNameList: currentPokemonNameList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonlistBloc, PokemonlistState>(
      builder: (context, state) {
        if (state is EmptyState) {
          BlocProvider.of<PokemonlistBloc>(context).add(
            GetFirstPageListOfPokemons(),
          );
          return Container();
        }

        if (state is Loading) {
          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.currentPokemonList,
            extraWidget: LoadingWidget(),
          );
        }

        if (state is Listing) {
          updateState(
            newUrl: state.url,
            newPokemonNameList: state.pokemonNameList.results,
          );

          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.pokemonNameList.results,
            extraWidget: LoadingWidget(),
          );
        }

        if (state is Loaded) {
          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.pokemonNameList.results,
            extraWidget: LoadingWidget(),
          );
        }

        if (state is ErrorState) {
          updateState(
            newUrl: state.url,
            newPokemonNameList: state.pokemonNameList,
          );

          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.pokemonNameList,
            extraWidget: ShowErrorWidget(
              message: state.error,
              icon: Icons.signal_wifi_off,
              retryFunction: _retry,
            ),
          );
        }

        return Container();
      },
    );
  }

  void updateState(
      {String newUrl, List<PokemonNameItemEntity> newPokemonNameList}) {
    url = newUrl;
    currentPokemonNameList = newPokemonNameList;
  }
}
