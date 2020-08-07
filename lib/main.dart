import 'dart:async';
import 'dart:convert';

import 'package:app_gsa/concorrente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_gsa/logar.dart';
import 'package:app_gsa/page_price.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Concorrente(),
    theme: ThemeData(
        hintColor: Colors.blue[900],
        primaryColor: Colors.blue[900],
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[900])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[900])),
            hintStyle: TextStyle(color: Colors.blue[900]))),
  ));
}
