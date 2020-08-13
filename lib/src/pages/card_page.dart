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
        children: <Widget>[
          SizedBox(height: 30),
          _cardTipoUno(),
          SizedBox(height: 30),
          _cardTipoDos(),
          SizedBox(height: 30),
          _cardTipoTres()
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

  Widget _cardTipoDos() {
    final Widget card = Container(
      child: Column(
        children: <Widget>[
          Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1541780803344-836ca89a4e97?ixlib=rb-1.2.1&auto=format&fit=crop&w=1178&q=80}')),
          Container(
            padding: EdgeInsets.all(10.5),
            child: Text('No tengo iamgenes'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(8.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  Widget _cardTipoTres() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1541780803344-836ca89a4e97?ixlib=rb-1.2.1&auto=format&fit=crop&w=1178&q=80}'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.5),
            child: Text('Nueva forma de cargar imagenes'),
          )
        ],
      ),
    );
  }
}
