import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/consts/const.app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeApiStore pokeApiStore = PokeApiStore();
    pokeApiStore.fetchePokemonList();
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.6),
            left: screenWidth - 240 / 1.6,
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(child: Observer(builder: (BuildContext context) {
                  PokeAPI _pokeApi = pokeApiStore.pokeAPI;
                  return (pokeApiStore.pokeAPI != null)
                      ? AnimationLimiter(
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.all(12),
                              addAutomaticKeepAlives: true,
                              itemCount: _pokeApi.pokemon.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(_pokeApi.pokemon[index].name));
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
