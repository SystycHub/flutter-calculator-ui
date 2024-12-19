import 'package:flutter/material.dart';

class KmMilesConverter extends StatefulWidget {
  @override
  _KmMilesConverterState createState() => _KmMilesConverterState();
}

class _KmMilesConverterState extends State<KmMilesConverter> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _convertKmToMiles() {
    double km = double.tryParse(_controller.text) ?? 0;
    double miles = km * 0.621371; // Kilomeetri teisendamine miilideks
    setState(() {
      _result = '$km km = ${miles.toStringAsFixed(2)} miili';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Km - Miili teisendaja'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisesta kilomeetrid',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertKmToMiles,
              child: Text('Teisenda'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
