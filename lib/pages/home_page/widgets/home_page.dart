import 'package:flutter/material.dart';
import 'package:pokedex/consts/const.app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Image.asset(ConstsApp.blackPokeball)
      ],),
    );
  }
}