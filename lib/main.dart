import 'dart:io';

import 'package:flutter/material.dart';

import 'search/login_screen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    title: 'route',
    initialRoute: '/',
    routes: {'/': (context) => LoginScreen()},
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
