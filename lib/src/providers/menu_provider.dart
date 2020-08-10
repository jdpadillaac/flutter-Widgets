import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {}

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('uploads/menu_opts.json');
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
