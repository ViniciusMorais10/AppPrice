import 'dart:convert';
import 'dart:async';
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

  Future<List<User>> _getUser() async {
    var data = await http.get(
        "http://192.168.112.200:2845/api/pedido/TAgendamento/ListarConcorrentes");

    var jsonData = json.decode(data.body);

    //print(jsonData);
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["CODCONC"], u["CONCORR"]);
      users.add(user);
      print(users.length);
    }

    return users;
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
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Carregando......."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].concorr),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class User {
  final int codconc;
  final String concorr;

  User(this.codconc, this.concorr);
}
