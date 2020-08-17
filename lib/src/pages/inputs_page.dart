import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = 'Inputs';
  String _fecha = '';
  String _optsSelected = 'Volar';
  TextEditingController _inputFiledDateController = new TextEditingController();

  List<String> _poderes = ['Volar', 'Rayos x'];

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
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: false,
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
      autofocus: false,
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
      autofocus: false,
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

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFiledDateController,
      enableInteractiveSelection: false,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.2)),
          hintText: 'Fecha de nacimiento',
          labelText: '¿En que día naciste?',
          helperText: 'Debes seleccionar una fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.perm_contact_calendar)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        cancelText: 'CANCELAR',
        confirmText: 'ACEPTAR',
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2030),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFiledDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptsDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(child: Text(element), value: element));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 28.5),
        Expanded(
          child: DropdownButton(
              value: _optsSelected,
              items: getOptsDropDown(),
              onChanged: (opt) {
                setState(() {
                  _optsSelected = opt;
                });
              }),
        )
      ],
    );
  }
}
