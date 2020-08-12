import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icons_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 3.0,
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData().then((options) {
    //   print('Lista');
    //   print(options);
    // });

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snp) {
        return ListView(
          children: _listaItems(snp.data, context),
        );
      },
    );

    // return ListView(
    //   children: _listaItems(),
    // );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opts = [];

    data.forEach((element) {
      final widgetsTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
          // Esta opcion es solo para ir a un ruta, ya que NO es de manera dinamica
          // final route = MaterialPageRoute(builder: (context) {
          //   return AlertPage();
          // });
          // Navigator.push(context, route);
        },
      );

      opts..add(widgetsTemp)..add(Divider());
    });

    return opts;
  }
}
