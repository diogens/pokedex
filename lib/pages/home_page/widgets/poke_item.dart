import 'package:flutter/material.dart';
import 'package:pokedex/consts/const.app.dart';
import 'package:pokedex/consts/const_api.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final Widget image;
  final List<String> types;

  Widget setTipos() {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(80, 255, 255, 255)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ));
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    ); //
  }

  const PokeItem({this.name, this.index, this.color, this.image, this.types});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Align(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Opacity(
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                    ),
                    opacity: 0.2,
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
              Align(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: image,
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0, top: 60),
                child: setTipos(),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: ConstsAPI.getColorType(type: types[0]),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
