import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String nama;
  final String nik;
  final String content;

  const DetailWidget(
      {Key? key, required this.nama, required this.nik, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        nama,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
