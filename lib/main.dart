import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//controller
  TextEditingController etInput = new TextEditingController();
//variabel
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      });
  }

  void perhitungan() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplikasi Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber[900],
            leading: new Icon(Icons.home),
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
            children: [
              Input(etInput: etInput),
              DropdownButton<String>(
                    items: listItem.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue,
                    onChanged: dropdownOnChanged,
                  ),
                  Result(
                    result: _result,
                  ),
                  Convert(
                    konvertHandler: perhitungan,
                  ),
                ],
              ),
          ),
          ),
        );
  }
}
