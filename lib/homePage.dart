import 'package:flutter/material.dart';
import 'package:kegiatan1ab/getDetail.dart';
import 'package:kegiatan1ab/getVaccine.dart';
import 'package:kegiatan1ab/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  // final String? name, nim;
  // const homePage({Key? key, required this.name, required this.nim})
  //     : super(key: key);
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _fiture = ["certivicate", "result", "ehac"];
  late SharedPreferences loginData;
  String username = "";
  String name = "";
  String nim = "";

  @override
  initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username')!;
      name = loginData.getString('name')!;
      nim = loginData.getString('nim')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kegiatan1ab',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.supervised_user_circle_outlined,
            color: Colors.black,
          ),
          title: Text(
            "Hi, ${name}",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          actions: [
            IconButton(
              onPressed: () {
                loginData.setBool('login', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 110,
                width: double.infinity,
                child: (Card(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10)),
                          Text(
                            "Entering a public space?",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: ElevatedButton.icon(
                              label: Text(
                                "Scan QR Code",
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              icon: const Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.lightBlue,
                                size: 12.0,
                              ),
                              onPressed: () {
                                print('Pressed');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                fixedSize: Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/scan.png'),
                            width: 70,
                            height: 70,
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(top: 5),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  childAspectRatio: 0.75,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: <Widget>[
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetDetail(fiture: _fiture[0])));
                            },
                            child: Image(
                              image:
                                  AssetImage('assets/images/certificate.png'),
                              width: 70,
                              height: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Vaccine Certivicate',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetDetail(fiture: _fiture[1])));
                            },
                            child: Image(
                              image:
                                  AssetImage('assets/images/temperature.png'),
                              width: 45,
                              height: 45,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Covid-19 Test Result',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      GetDetail(fiture: _fiture[0])));
                            },
                            child: Image(
                              image: AssetImage('assets/images/shield.png'),
                              width: 50,
                              height: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'EHAC',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetDetail(fiture: _fiture[2])));
                            },
                            child: Image(
                              image: AssetImage('assets/images/suitcase.png'),
                              width: 70,
                              height: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Travels Regulation',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Image(
                              image:
                                  AssetImage('assets/images/stethoscope.png'),
                              width: 50,
                              height: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Telemedicine',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Image(
                              image: AssetImage(
                                  'assets/images/hospital-building.png'),
                              width: 50,
                              height: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Healthcare Facility',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Image(
                              image: AssetImage('assets/images/analysis.png'),
                              width: 45,
                              height: 45,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Covid-19 Statistic',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => getVaccine()),
                              );
                            },
                            child: Image(
                              image: AssetImage('assets/images/injection.png'),
                              width: 45,
                              height: 45,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Get Vaccine',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Image(
                              image: AssetImage('assets/images/bed.png'),
                              width: 50,
                              height: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 100),
                              primary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Text(
                            'Find Hospital Bed',
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.question_mark,
            color: Colors.lightBlue,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
