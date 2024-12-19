import 'package:flutter/material.dart';
import 'calculator_controller.dart';
import 'km_miles_converter.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  final CalculatorController _controller = CalculatorController();
  double _firstNumber = 0, _secondNumber = 0;
  String _operation = '';
  String _display = '0';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _display = '0';
        _firstNumber = 0;
        _secondNumber = 0;
        _operation = '';
      } else if (value == '=' && _operation.isNotEmpty) {
        _controller.calculate(_operation, _firstNumber, _secondNumber);
        _display = _controller.result.toString();
      } else if (['+', '-', '*', '/'].contains(value)) {
        _operation = value;
        _firstNumber = double.parse(_display);
        _display = '0';
      } else {
        _display = _display == '0' ? value : _display + value;
        if (_operation.isNotEmpty) _secondNumber = double.parse(_display);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulaator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              color: Colors.black12,
              child: Text(
                _display,
                style: TextStyle(fontSize: 36, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildButtonRow(['7', '8', '9', '/']),
                _buildButtonRow(['4', '5', '6', '*']),
                _buildButtonRow(['1', '2', '3', '-']),
                _buildButtonRow(['C', '0', '=', '+']),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KmMilesConverter()),
              );
            },
            child: Text('Ava teisendaja ekraan'),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons.map((btn) => _buildButton(btn)).toList(),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.blue[200],
      ),
      onPressed: () => _onButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
