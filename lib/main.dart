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
    home: PagePrice(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Colors.white))),
  ));
}
