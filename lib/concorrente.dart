import 'dart:convert';

import 'package:app_gsa/Api.dart';
import 'package:app_gsa/listarconcorrente.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Concorrente extends StatefulWidget {
  @override
  _ConcorrenteState createState() => _ConcorrenteState();
}

class _ConcorrenteState extends State<Concorrente> {
  var lista = new List<ListarConcorrente>();

  _getConcorr() {
    Api.getConcorrente().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        lista =
            lista.map((model) => ListarConcorrente.fromJson(model)).toList();
      });
    });
  }

  _ConcorrenteState() {
    _getConcorr();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Escolha o concorrente:",
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: listaConcorrentes());
  }

//http://192.168.112.200:2845/api/pedido/TAgendamento/ListarConcorrentes
  listaConcorrentes() {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              lista[index].cONCORR,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          );
        });
  }
}
