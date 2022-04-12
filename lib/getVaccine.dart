import 'package:flutter/material.dart';

class getVaccine extends StatefulWidget {
  const getVaccine({Key? key}) : super(key: key);

  @override
  State<getVaccine> createState() => _getVaccineState();
}

class _getVaccineState extends State<getVaccine> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _idNumber = "";
  String _name = "";
  TextEditingController controllerIdNumber = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  // User user = User(idNumber: _idNumber, name: _name);

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
            "Go Get Fuccine Bass start",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("ID Number ${_idNumber}")],
                          ),
                          Text("Your Name ${_name}"),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          TextField(
                            controller: controllerIdNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "ID Number",
                                hintText: "ID Number"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          TextField(
                            controller: controllerName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Full Name",
                                hintText: "Full Name"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          SizedBox(
                            width: 290,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                // async {
                                //   _idNumber = await Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (_) => homePage()),
                                //   );
                                setState(() {
                                  _idNumber = controllerIdNumber.text;
                                  _name = controllerName.text;
                                  controllerIdNumber.text = "";
                                  controllerName.text = "";
                                });
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
