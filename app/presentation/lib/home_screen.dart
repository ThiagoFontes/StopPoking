import 'package:domain/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/widgets/pokemon_item_list_widget.dart';
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
            extraWidget: ErrorWidget(
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

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget(
      {Key key,
      @required ScrollController scrollController,
      @required Function handleScrollNotification,
      @required this.list,
      this.extraWidget})
      : _scrollController = scrollController,
        _handleScrollNotification = handleScrollNotification,
        super(key: key);

  final ScrollController _scrollController;
  final List<PokemonNameItemEntity> list;
  final Function _handleScrollNotification;
  final Widget extraWidget;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: extraWidget != null ? list.length + 1 : list.length,
        itemBuilder: (context, i) {
          if (i < list.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PokemonItemWidget(
                name: list[i].name,
                pokedexNumber: i + 1,
              ),
            );
          } else {
            return extraWidget;
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key key, @required message, @required retryFunction, icon})
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
