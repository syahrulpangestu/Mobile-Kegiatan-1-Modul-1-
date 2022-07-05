import 'package:flutter/material.dart';
import 'package:kegiatan1ab/models/berita_model.dart';
import 'package:kegiatan1ab/screens/berita_add_data.dart';
import 'package:kegiatan1ab/service/api_service.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ViewData extends StatefulWidget {
  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  late BuildContext context;
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return MaterialApp(
      key: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Crud REST API"), actions: <Widget>[
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FormAddScreen()));
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return FormAddScreen(
                    beritaModel: BeritaModel(
                        judul: '',
                        deskripsi: '',
                        image: '',
                        user_id: 0,
                        category_id: 0));
              }));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ]),
        body: SafeArea(
          child: FutureBuilder(
            future: apiService.getBeritaModel(),
            builder: (BuildContext context,
                AsyncSnapshot<List<BeritaModel>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<BeritaModel>? beritaModels = snapshot.data;
                return _buildListView(beritaModels!);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<BeritaModel> beritaModels) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          BeritaModel beritaModel = beritaModels[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      beritaModel.judul,
                      // style: Theme.of(context).textTheme.title,
                    ),
                    Text(beritaModel.deskripsi),
                    Text(beritaModel.updated_at.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Warning"),
                                  content: Text(
                                      "Are you sure want to delete data profile ${beritaModel.judul}?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Yes"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        apiService
                                            .deleteBeritaModel(beritaModel.id)
                                            .then((isSuccess) {
                                          if (isSuccess) {
                                            setState(() {});
                                            Scaffold.of(this.context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Delete data success")));
                                          } else {
                                            Scaffold.of(this.context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Delete data failed")));
                                          }
                                        });
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("No"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FormAddScreen(beritaModel: beritaModel);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: beritaModels.length,
      ),
    );
  }
}
