import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex - DGS',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage()
    );
  }
}