import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Please fill out the form";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    _infoText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC Calculator"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cached,
                  color: Colors.amberAccent,
                  size: 35,
                  semanticLabel: 'Refresh Button'),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.amber,
                  size: 120,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Weight (Kg)",
                      labelStyle:
                          TextStyle(color: Colors.pinkAccent, fontSize: 25)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  controller: weightController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Height (Cm)",
                      labelStyle:
                          TextStyle(color: Colors.pinkAccent, fontSize: 25)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  controller: heightController,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Result",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                Text(
                  "$_infoText",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 25),
                )
              ],
            )));
  }
}
