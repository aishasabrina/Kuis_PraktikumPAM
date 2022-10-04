import 'package:flutter/material.dart';
import 'package:prak_kuis_124200056/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis Praktikum Mobile (124200056)',
      theme: ThemeData(
       backgroundColor: Colors.pink[100],
      ),
      home: MenuPage(),
    );
  }
}

