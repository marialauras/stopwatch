import 'package:stopwatch/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(Cronometro());

class Cronometro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cronômetro',
      home: Home(),
    );
  }
}
