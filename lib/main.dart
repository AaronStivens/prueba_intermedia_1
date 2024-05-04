import 'package:flutter/material.dart';
import 'dart:math';

class ColorChangeWidget extends StatefulWidget {
  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  // Definimos los nombres de los colores inicial y alternativo
  String _currentColorName = 'Azul';
  String _alternativeColorName = 'Rojo';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Al tocar el contenedor, llamamos a la función para cambiar el color
        _changeColor();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: _currentColor(),
            width: 200,
            height: 200,
            child: Center(
              // Mostramos el nombre del color actual
              child: Text(
                'Color Actual: $_currentColorName',                
                style: TextStyle(
                  color: _textColor(), // Cambia el color del texto
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio entre el contenedor y el texto adicional
          Text(
            'Aaron Hernandez - 61711197',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Función para cambiar el color del contenedor
  void _changeColor() {
    // Generamos colores aleatorios para el color actual y el alternativo
    _currentColorName = _randomColorName();
    _alternativeColorName = _randomColorName();

    setState(() {
      // Asignamos los nuevos nombres de color generados
      _currentColorName = _currentColorName;
      _alternativeColorName = _alternativeColorName;
    });
  }

  // Función para generar un nombre de color aleatorio
  String _randomColorName() {
    List<String> colors = ['Rojo', 'Azul', 'Verde', 'Amarillo', 'Naranja', 'Rosa', 'Morado'];
    return colors[Random().nextInt(colors.length)];
  }

  // Función para obtener el color actual
  Color _currentColor() {
    switch (_currentColorName) {
      case 'Rojo':
        return Colors.red;
      case 'Azul':
        return Colors.blue;
      case 'Verde':
        return Colors.green;
      case 'Amarillo':
        return Colors.yellow;
      case 'Naranja':
        return Colors.orange;
      case 'Rosa':
        return Colors.pink;
      case 'Morado':
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }

//Si el fondo es naranja o amarillo letras se cambia de color a negro
  Color _textColor() {
    if (_currentColorName == 'Naranja' || _currentColorName == 'Amarillo') {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
// Ejemplo de uso de ColorChangeWidget
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Cambio de color al hacer click'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ColorChangeWidget(),      
      ),
    ),
  ));
}
