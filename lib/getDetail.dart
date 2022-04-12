import 'package:flutter/material.dart';

class GetDetail extends StatelessWidget {
  String fiture;

  GetDetail({required this.fiture});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kegiatan1ab',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            fiture,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
