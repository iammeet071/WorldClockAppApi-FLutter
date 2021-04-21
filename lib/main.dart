import 'package:flutter/material.dart';
import 'package:wroldclock/pages/home.dart';
import 'package:wroldclock/pages/loading.dart';
import 'package:wroldclock/pages/location_chose.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChoosLocation(),
    },
  ));
}
