import 'package:domain/entities.dart';
import 'package:flutter/material.dart';

import 'pokemon_item_list_widget.dart';

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
