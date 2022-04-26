import 'package:flutter/material.dart';

class GetDetail extends StatelessWidget {
  String fiture;
  final List dokter = [
    "Tri Widiarsih",
    "Samuel Umtiti",
    "Ngolo Kante",
    "Van Basten",
    "Jayjay Okocha",
    "Christian Bekamenga",
    "Eduardo Ivakdalam",
    "Toko Ekambi",
    "Sambi Lokonga",
    "Igor Tudor",
    "Lutfi Anam",
    "Bio Paulin"
  ];

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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  "dr. " + dokter[index],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('Jadwal praktik dr. ' + dokter[index]),
                leading: CircleAvatar(
                  child: Text(dokter[index][0], style: TextStyle(fontSize: 20)),
                ),
              ),
            );
          },
          itemCount: dokter.length,
        ),
      ),
    );
  }
}
