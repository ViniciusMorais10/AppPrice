import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PagePrice extends StatefulWidget {
  @override
  _PagePriceState createState() => _PagePriceState();
}

class _PagePriceState extends State<PagePrice> {
  String codauxiliar;
  String _descricao = "";
  String _json = "";
  FocusNode focusCodigo;
  FocusNode focusAtacado;
  FocusNode focusVarejo;

  TextEditingController codigo = TextEditingController();
  TextEditingController pvenda = TextEditingController();
  TextEditingController patacado = TextEditingController();
  TextEditingController concorre = TextEditingController();

  Future<Map<String, dynamic>> getJsonData() async {
    //_matricula = user.text;
    //_senha = password.text;
    codauxiliar = codigo.text;
    final String url =
        "http://192.168.110.239:8080/api_gsa/api/descricao/$codauxiliar";
    var response = await http.get(url);
    var data = json.decode(response.body);
    print(data['descricao']);
    setState(() {
      _json = data['descricao'];
    });
    _json = data['descricao'];
    return (data);
  }

  Future<String> postJson() async {
    String url = "http://192.168.112.200:2845/api/pedido/TAgendamento/Item";
    String str = '{"codconcorr": 3,"codigo": ' +
        codauxiliar +
        ',"pvarejo":' +
        pvenda.text +
        ',"patacado":' +
        patacado.text +
        '}';
    var resp = await http.post(url, body: str);
    if (resp.statusCode == 200) {
      setState(() {
        codigo.text = "";
        patacado.text = "";
        pvenda.text = "";
      });
    } else {
      return null;
    }
  }

  void buscar() {
    this.getJsonData().then((data) {});
    //codigo.text = "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusCodigo = FocusNode();
    focusAtacado = FocusNode();
    focusVarejo = FocusNode();
  }

  void dispose() {
    focusCodigo.dispose();
    focusAtacado.dispose();
    focusVarejo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text(
          "GSA - InfoPrice ",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Informe Código de Barras",
                style: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
              TextField(
                autofocus: true,
                focusNode: focusCodigo,
                controller: codigo,
                onSubmitted: (text) {
                  setState(() {
                    codauxiliar = text;
                    buscar();
                  });
                },
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
              Divider(),
              Text(
                "Descrição do Produto",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              Divider(),
              Text(
                _json.toUpperCase(),
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(height: 25.0),
              Text(
                "Preços",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(height: 10.0),
              TextField(
                  controller: patacado,
                  focusNode: focusAtacado,
                  decoration:
                      InputDecoration(labelText: "Atacado", prefixText: "R\$"),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  textAlign: TextAlign.center,
                  onSubmitted: (contextr) {
                    FocusScope.of(context).requestFocus(focusVarejo);
                  }),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                controller: pvenda,
                focusNode: focusVarejo,
                decoration: InputDecoration(
                  labelText: "Varejo",
                  prefixText: "R\$",
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.0),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    postJson();
                    Fluttertoast.showToast(
                      msg: "Salvo com Sucesso!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      //timeInSecForIos: 1,
                      backgroundColor: Colors.blue[900],
                      textColor: Colors.white,
                      fontSize: 18.0,
                    );
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue[900]),
                  ),
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
