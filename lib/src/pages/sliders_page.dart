import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 200.0;
  bool _valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitchTile(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamanio de la imagen $_sliderValue',
        // divisions: 20,
        value: _sliderValue,
        min: 10.0,
        max: 400.0,
        onChanged: (_valueCheck)
            ? null
            : (value) {
                setState(() {
                  _sliderValue = value;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://dam.smashmexico.com.mx/wp-content/uploads/2018/08/13143111/the-flash-serie-temporada-5-traje-referencia-comics-cover.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _valueCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _valueCheck = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Checkbox'),
        value: _valueCheck,
        onChanged: (value) {
          setState(() {
            _valueCheck = value;
          });
        });
  }

  Widget _crearSwitchTile() {
    return SwitchListTile(
        title: Text('Checkbox'),
        value: _valueCheck,
        onChanged: (value) {
          setState(() {
            _valueCheck = value;
          });
        });
  }
}
