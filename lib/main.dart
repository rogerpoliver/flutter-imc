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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Please fill out the form";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Please fill out the form";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      debugPrint(imc.toString());
      if (imc < 15) {
        _infoText = "${imc.toStringAsPrecision(4)} - Very severely underweight";
      } else if (imc <= 16) {
        _infoText = "${imc.toStringAsPrecision(4)} - Severely underweight";
      } else if (imc <= 18.5) {
        _infoText = "${imc.toStringAsPrecision(4)} - Underweight";
      } else if (imc <= 25) {
        _infoText = "${imc.toStringAsPrecision(4)} - Normal (healthy weight)";
      } else if (imc <= 30) {
        _infoText = "${imc.toStringAsPrecision(4)} - Overweight";
      } else if (imc <= 35) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class I (Moderately obese)";
      } else if (imc <= 40) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class II (Severely obese)";
      } else if (imc <= 45) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class III (Very severely obese)";
      } else if (imc <= 50) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class IV (Morbidly obese)";
      } else if (imc <= 60) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class V (Super obese)";
      } else if (imc > 60) {
        _infoText =
            "${imc.toStringAsPrecision(4)} - Obese Class VI (Hyper obese)";
      }
    });
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
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.amber,
                    size: 120,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight (Kg)",
                        labelStyle:
                            TextStyle(color: Colors.pinkAccent, fontSize: 25)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height (Cm)",
                        labelStyle:
                            TextStyle(color: Colors.pinkAccent, fontSize: 25)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the value';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _calculate();
                          }
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
              )),
        ));
  }
}
