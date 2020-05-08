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
        _scrollController.position.extentAfter <= 18 * 4) {
      BlocProvider.of<PokemonlistBloc>(context).add(
        GetPagedListOfPokemons(
          url: url,
          currentPokemonNameList: currentPokemonNameList,
        ),
      );
    }
    return false;
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
            isLoading: true,
          );
        }
        if (state is Listing) {
          url = state.url;
          currentPokemonNameList = state.pokemonNameList.results;

          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.pokemonNameList.results,
            isLoading: true,
          );
        }
        if (state is Loaded) {
          return PokemonListWidget(
            scrollController: _scrollController,
            handleScrollNotification: _handleScrollNotification,
            list: state.pokemonNameList.results,
            isLoading: false,
          );
        }

        return Container();
      },
    );
  }
}

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    Key key,
    @required ScrollController scrollController,
    @required Function handleScrollNotification,
    @required this.list,
    this.isLoading,
  })  : _scrollController = scrollController,
        _handleScrollNotification = handleScrollNotification,
        super(key: key);

  final ScrollController _scrollController;
  final List<PokemonNameItemEntity> list;
  final Function _handleScrollNotification;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: isLoading ? list.length + 1 : list.length,
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
