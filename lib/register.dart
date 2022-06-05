import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kegiatan1ab/auth.dart';
import 'package:kegiatan1ab/homePage.dart';
import 'package:kegiatan1ab/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

Authentication authentication = Authentication(FirebaseAuth.instance);

class _RegisterState extends State<Register> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                              "Register Peduli Tida Peduli",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 20),
                          ),
                          TextField(
                            controller: controllerEmail,
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
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Back to Login",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          SizedBox(
                            width: 290,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Register"),
                              onPressed: () async {
                                String _email = controllerEmail.text;
                                String _password = controllerPassword.text;
                                controllerPassword.text = "";
                                controllerEmail.text = "";
                                print(_email);
                                try {
                                  authentication.SignUp(
                                      email: _email, password: _password);
                                } on FirebaseAuthException catch (e) {
                                  debugPrint(e.message ?? "unknown error");
                                }
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
}
