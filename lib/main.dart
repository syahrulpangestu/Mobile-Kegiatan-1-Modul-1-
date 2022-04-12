import 'package:flutter/material.dart';
import 'package:kegiatan1ab/getVaccine.dart';
import 'package:kegiatan1ab/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kegiatan1ab',
      home: homePage(),
    );
  }
}
