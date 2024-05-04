import 'package:flutter/material.dart';
import 'dart:math';

class ColorChangeWidget extends StatefulWidget {
  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  // Definimos los colores inicial y alternativo
  Color _currentColor = Colors.blue;
  Color _alternativeColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Al tocar el contenedor, llamamos a la función para cambiar el color
        _changeColor();
      },
      child: Container(
        // Establecemos el color actual del contenedor
        color: _currentColor,
        width: 200,
        height: 200,
        child: Center(
          // Mostramos el nombre del color actual
          child: Text(
            'Color Actual: ${_currentColor}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Función para cambiar el color del contenedor
  void _changeColor() {
    // Generamos colores aleatorios para el color actual y el alternativo
    Color newColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    Color newAlternativeColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

    setState(() {
      // Asignamos los nuevos colores generados
      _currentColor = newColor;
      _alternativeColor = newAlternativeColor;
    });
  }
}

// Ejemplo de uso de ColorChangeWidget
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Color Change Widget Example'),
      ),
      body: Center(
        child: ColorChangeWidget(),
      ),
    ),
  ));
}
