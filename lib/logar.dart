import 'dart:convert';
import 'package:app_gsa/page_price.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _matricula, _senha;
  String log_response = "Informe suas credenciais";
  String statuscode;

  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<String> getJsonData() async {
    _matricula = user.text;
    _senha = password.text;

    final String url =
        "http://192.168.110.239:8080/api_gsa/api/logar/$_matricula/$_senha";
    var response = await http.get(url);
    var data = json.decode(response.body);
    setState(() {
      print(response.body);
      if (response.body == "false") {
        log_response = "Usuário ou Senha inválidos!";
      } else {
        log_response = "Sucesso";

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PagePrice()));
      }
    });

    return "OK";
  }

  void _logar() {
    setState(() {
      if (user.text == "" && password.text == "") {
        log_response = "Informe seus dados";
      } else {
        getJsonData();
      }
    });
  }

  // Future<Map> logar() async {
  //   http.Response response;
  //   _matricula = user.text;
  //   _senha = password.text;
  //   response = await http.get(
  //       "http://192.168.110.239:8080/api_gsa/api/logar/$_matricula/$_senha");
  //   statuscode = response.statusCode;
  //   print(response);
  //   if (statuscode == 200) {
  //     return json.decode(response.body.toString());
  //   } else {
  //     return null;
  //   }
  // }

  // void validar() {
  //   logar().then((map) {
  //     print(map);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                "images/logo.png",
                width: 80.0,
                height: 80.0,
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 120.0,
                    color: Colors.white,
                  ),
                ],
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: user,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: password,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                log_response,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                height: 45.0,
                child: RaisedButton(
                  autofocus: true,
                  onPressed: () {
                    _logar();
                  },
                  child: Text(
                    "Logar",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
