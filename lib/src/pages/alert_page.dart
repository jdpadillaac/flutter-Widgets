import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      body: Center(child: _botonAlerta(context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _botonAlerta(BuildContext context) {
    return RaisedButton(
        onPressed: () => _mostrarAlerta(context),
        child: Text('Mostrar boton'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder());
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Aqui vamos again'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'))
            ],
          );
        });
  }
}
