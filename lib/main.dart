import 'package:flutter/material.dart';

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

class CalculatorUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulaator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Ekraani ala
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              color: Colors.black12,
              child: Text(
                '0',
                style: TextStyle(fontSize: 36, color: Colors.black),
              ),
            ),
          ),
          // Nuppude ala
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
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
