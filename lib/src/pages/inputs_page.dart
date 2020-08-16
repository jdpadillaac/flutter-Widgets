import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = 'Inputs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inpusts'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
          _crearEmail(),
          Divider(),
          _crearPassword()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.2)),
          counter: Text('Cantidad de letras'),
          hintText: 'Deberias ingresar esa vaina',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          print(value);
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(title: Text('Nombre es: $_nombre'));
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.2)),
          counter: Text('Cantidad de letras'),
          hintText: 'Deberias ingresar esa vaina',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          print(value);
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.2)),
          hintText: 'El nombre de tu perro por ejemplo',
          labelText: 'Contraseña',
          helperText: 'Entre 2 y 10 caracteres',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.alternate_email)),
      onChanged: (value) {
        setState(() {
          print(value);
          _nombre = value;
        });
      },
    );
  }
}
