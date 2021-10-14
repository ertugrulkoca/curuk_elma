import 'package:curuk_elma/ana_ekran.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Çürük Elma',
      home: AnaEkran(),
    );
  }
}
