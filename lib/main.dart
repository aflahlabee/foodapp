import 'dart:io';

import 'package:flutter/material.dart';

import 'package:food_delivery/screens/Login_page.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/items.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()));

  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
