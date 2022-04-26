import 'package:flutter/material.dart';
import 'package:kegiatan1ab/dummy_data.dart';
import 'package:kegiatan1ab/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _idNumber = "";
  // String _name = "";
  TextEditingController controllerUSername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  late SharedPreferences loginData;
  late bool checkLogin;

  @override
  initState() {
    super.initState();
    check_if_already_login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kegiatan1ab',
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(30),
              color: Colors.grey[100],
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Login Peduli Tida Peduli",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 20),
                          ),
                          TextField(
                            controller: controllerUSername,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Username",
                                hintText: "Username"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          TextField(
                            controller: controllerPassword,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password",
                                hintText: "Password"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          SizedBox(
                            width: 290,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Submit"),
                              onPressed: () async {
                                // final storeData =
                                //     await SharedPreferences.getInstance();
                                // for (var data in DummyData.data) {
                                //   print("cek");
                                //   if ((controllerUSername.text ==
                                //       data['username'])) {
                                //     await storeData.setString(
                                //         'nim', data['Nim']);
                                //     await storeData.setString(
                                //         'username', data['username']);
                                //     await storeData.setString(
                                //         'name', data['nama']);
                                //     await storeData.setBool(
                                //         'checkLogin', false);
                                //     String? nim = storeData.getString('nim');
                                //     String? username =
                                //         storeData.getString('username');
                                //     String? name = storeData.getString('name');
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => homePage(
                                //                 name: name, nim: nim)));
                                //   } else {
                                //     print("failed");
                                //   }
                                // }
                                String _username = controllerUSername.text;
                                String _password = controllerPassword.text;
                                for (var data in DummyData.data) {
                                  if (_username == data['username']) {
                                    if (_password == data['password']) {
                                      print("sukses");
                                      await loginData.setString(
                                          'nim', data['Nim']);
                                      await loginData.setString(
                                          'username', data['username']);
                                      await loginData.setString(
                                          'name', data['nama']);
                                      await loginData.setBool('login', false);
                                      // loginData.setBool('login', false);
                                      // loginData.setString('username', _username);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => homePage(),
                                        ),
                                      );
                                    }
                                    // else {
                                    //   loginFail(context);
                                    // }
                                  }
                                  // else {
                                  //   loginFail(context);
                                  // }
                                }
                                controllerPassword.text = "";
                                controllerUSername.text = "";
                                // });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    checkLogin = (loginData.getBool('login') ?? true);

    print(checkLogin);
    if (checkLogin == false) {
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => homePage(),
        ),
      );
    }
  }

  loginFail(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Login Failed",
      desc: "Wrong Username or Password",
      buttons: [
        DialogButton(
          child: Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        )
      ],
    ).show();
  }
}
