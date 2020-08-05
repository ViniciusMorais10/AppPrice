import 'package:flutter/material.dart';

class Concorrente extends StatefulWidget {
  @override
  _ConcorrenteState createState() => _ConcorrenteState();
}

class _ConcorrenteState extends State<Concorrente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Escolha o concorrente:",
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[400],
    );
  }
}
