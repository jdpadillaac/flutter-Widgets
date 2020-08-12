import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        // padding: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: <Widget>[_cardTipoUno()],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Titulo de tarjeta'),
            subtitle: Text(
                'Esto es un titulo largo, bueno creo que debe ser mas largo'),
            leading: Icon(
              Icons.phone_iphone,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('OK'))
            ],
          )
        ],
      ),
    );
  }
}
