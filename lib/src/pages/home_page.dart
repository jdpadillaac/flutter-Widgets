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
        print(snp.data);
        return ListView(
          children: _listaItems(snp.data),
        );
      },
    );

    // return ListView(
    //   children: _listaItems(),
    // );
  }

  List<Widget> _listaItems(List<dynamic> data) {
    final List<Widget> opts = [];

    data.forEach((element) {
      final widgetsTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey),
        onTap: () {},
      );

      opts..add(widgetsTemp)..add(Divider());
    });

    return opts;
  }
}
