import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage> {
  ScrollController _scrolController = new ScrollController();

  List<int> _liostaNumeros = new List();
  int _ultimoNumero = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _agregarDiez();
    _scrolController.addListener(() {
      if (_scrolController.position.pixels ==
          _scrolController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrolController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lista')),
        body: Stack(
          children: [_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrolController,
        itemCount: _liostaNumeros.length,
        itemBuilder: (BuildContext context, index) {
          final imagen = _liostaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?image=$imagen'));
        },
      ),
    );
  }

  void _agregarDiez() {
    for (var i = 0; i < 10; i++) {
      _ultimoNumero++;
      _liostaNumeros.add(_ultimoNumero);
    }

    setState(() {});
  }

  Future fetchData() async {
    _loading = true;
    setState(() {});

    final Duration duarion = new Duration(seconds: 2);
    new Timer(duarion, respuestahttp);
  }

  void respuestahttp() {
    _loading = false;

    _scrolController.animateTo(_scrolController.position.pixels + 100,
        duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);

    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _obtenerPagina1() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _liostaNumeros.clear();
      _ultimoNumero++;
      _agregarDiez();
    });

    return Future.delayed(duration);
  }
}
