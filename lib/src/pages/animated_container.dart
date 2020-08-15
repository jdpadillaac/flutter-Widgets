import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _heidht = 50.0;
  Color _color = Colors.purple;

  BorderRadiusGeometry _boderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contenedor animado'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _heidht,
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            decoration:
                BoxDecoration(borderRadius: _boderRadius, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final ramdom = Random();

            setState(() {
              _width = ramdom.nextInt(300).toDouble();
              _heidht = ramdom.nextInt(300).toDouble();
              _color = Color.fromRGBO(ramdom.nextInt(255), ramdom.nextInt(255),
                  ramdom.nextInt(255), 1);
              _boderRadius =
                  BorderRadius.circular(ramdom.nextInt(100).toDouble());
            });
          },
          child: Icon(Icons.play_arrow),
        ));
  }
}
