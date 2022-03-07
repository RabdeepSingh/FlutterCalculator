import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operationToPerform;

  String addNumbers() {
    return (firstnum + secondnum).toString();
  }

  String subNumbers() {
    return (firstnum - secondnum).toString();
  }

  String multiplyNumbers() {
    return (firstnum * secondnum).toString();
  }

  String divideNumbers() {
    return (firstnum / secondnum).toString();
  }

  String percentNumbers() {
    return (firstnum / 100 * secondnum).toString();
  }

  void pressedClear() {
    texttodisplay = "";
    firstnum = 0;
    secondnum = 0;
    res = "";
    operationToPerform = "";
  }

  void setOperationToPerform(String opt) {
    firstnum = int.parse(texttodisplay);
    res = "";
    operationToPerform = opt;
  }

  void pressedZero()
  {
    int no = int.parse(texttodisplay+"0");
    if(no==0)
    {
      texttodisplay = "0";
    }
  }

  void btnClicked(String btnval) {
    if (btnval == "+/-") return;

    if (btnval == "+" ||
        btnval == "-" ||
        btnval == "÷" ||
        btnval == "x" ||
        btnval == "%") {
      setOperationToPerform(btnval);
    } else {

      switch (btnval) {
        case "C":
          pressedClear();
          break;
        case "=":
          secondnum = int.parse(texttodisplay);
          switch (operationToPerform) {
            case "+":
              res = addNumbers();
              break;
            case "-":
              res = subNumbers();
              break;
            case "x":
              res = multiplyNumbers();
              break;
            case "÷":
              res = divideNumbers();
              break;
            case "%":
              res = percentNumbers();
              break;
          }
          break;
          
        default:
          res = (texttodisplay + btnval).toString();
      }
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String s, Color clr, double left, int fl) {
    return Expanded(
      flex: fl,
      child: OutlinedButton(
        onPressed: () => btnClicked(s),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(left, 25.0, left, 25.0),
            backgroundColor: clr,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Text(
          "$s",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Color peach = Color.fromARGB(255, 255, 149, 0);
    Color grey = Color.fromARGB(255, 80, 80, 80);
    Color black = Color.fromARGB(255, 28, 28, 28);
    Color lightgrey = Color.fromARGB(255, 132, 128, 128);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 80, 80, 80),
        title: Text("CALCULATOR "),
        backgroundColor: Color.fromARGB(255, 80, 80, 80),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                alignment: Alignment.bottomRight,
                color: Colors.grey,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,‹
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("C", grey, 25.0, 1),
                customButton("+/-", grey, 25.0, 1),
                customButton("%", grey, 25.0, 1),
                customButton("÷", peach, 25.0, 1),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("7", lightgrey, 25.0, 1),
                customButton("8", lightgrey, 25.0, 1),
                customButton("9", lightgrey, 25.0, 1),
                customButton("x", peach, 25.0, 1),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4", lightgrey, 25.0, 1),
                customButton("5", lightgrey, 25.0, 1),
                customButton("6", lightgrey, 25.0, 1),
                customButton("-", peach, 25.0, 1),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1", lightgrey, 25.0, 1),
                customButton("2", lightgrey, 25.0, 1),
                customButton("3", lightgrey, 25.0, 1),
                customButton("+", peach, 25.0, 1),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("0", lightgrey, 30.0, 2),
                customButton(".", lightgrey, 30, 1),
                customButton("=", peach, 30, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
