import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayat.dart';
import 'dropdown.dart';

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
  var listItem = ["Kelvin", "Reamur"]; //item untuk pilihan pada dropdown
  List<String> listViewItem = List<String>(); //listViewItem digunakan untuk membuat item dari list riwayat
  String _newValue = "Kelvin";
  double _result = 0;

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitungan(); //untuk auto konvert ketika mengganti value dropdown
      });
  }

  void perhitungan() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
        //menampilkan riwayat konversi
        listViewItem.add("$_newValue : $_result");
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
              DropdownKonversi(listItem: listItem, newValue: _newValue, dropdownOnChanged : dropdownOnChanged),
                  Result(
                    result: _result,
                  ),
                  Convert(
                    konvertHandler: perhitungan
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Riwayat Konversi",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                  ),
                  ),
                  Expanded(
                    child: Riwayat(listViewItem: listViewItem)
                  ),
                ],
              ),
          ),
          ),
        );
  }
}

