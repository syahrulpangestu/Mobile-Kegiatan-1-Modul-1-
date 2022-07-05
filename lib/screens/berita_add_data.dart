import 'package:flutter/material.dart';
import 'package:kegiatan1ab/models/berita_model.dart';
import 'package:kegiatan1ab/service/api_service.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class FormAddScreen extends StatefulWidget {
  BeritaModel beritaModel;
  FormAddScreen({required this.beritaModel});
  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool? _isFieldJudulValid;
  bool? _isFieldDeskripsiValid;
  bool? _isFieldImageValid;
  bool? _isFieldUser_IdValid;
  bool? _isFieldCategory_IdValid;
  // late bool _isFieldAgeValid;
  // late bool _isFieldEmailValid;
  // late bool _isFieldAgeValid;

  TextEditingController _controllerJudul = TextEditingController();
  TextEditingController _controllerDeskripsi = TextEditingController();
  TextEditingController _controllerImage = TextEditingController();
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerCategory = TextEditingController();
  // TextEditingController _controller = TextEditingController();
  // TextEditingController _controller = TextEditingController();
  // TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.beritaModel != null) {
      _isFieldJudulValid = true;
      _controllerJudul.text = widget.beritaModel.judul;
      _isFieldDeskripsiValid = true;
      _controllerDeskripsi.text = widget.beritaModel.deskripsi;
      _isFieldImageValid = true;
      _controllerImage.text = widget.beritaModel.image;
      _isFieldUser_IdValid = true;
      _controllerUser.text = widget.beritaModel.user_id.toString();
      _isFieldCategory_IdValid = true;
      _controllerCategory.text = widget.beritaModel.category_id.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.beritaModel == null ? "Form Add" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldJudul(),
                _buildTextFieldDeskripsi(),
                _buildTextFieldImage(),
                _buildTextFieldUser(),
                _buildTextFieldCategory(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_isFieldJudulValid == null ||
                          _isFieldDeskripsiValid == null ||
                          _isFieldImageValid == null ||
                          _isFieldUser_IdValid == null ||
                          _isFieldCategory_IdValid == null ||
                          !_isFieldJudulValid! ||
                          !_isFieldDeskripsiValid! ||
                          !_isFieldImageValid! ||
                          !_isFieldUser_IdValid! ||
                          !_isFieldCategory_IdValid!) {
                        scaffoldMessengerKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String judul = _controllerJudul.text.toString();
                      String deskripsi = _controllerDeskripsi.text.toString();
                      String image = _controllerImage.text.toString();
                      int user = int.parse(_controllerUser.text.toString());
                      int category =
                          int.parse(_controllerCategory.text.toString());

                      BeritaModel beritaModel = BeritaModel(
                          judul: judul,
                          deskripsi: deskripsi,
                          image: image,
                          user_id: user,
                          category_id: category);
                      if (widget.beritaModel == null) {
                        _apiService
                            .createBeritaModel(beritaModel)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(context);
                          } else {
                            scaffoldMessengerKey.currentState
                                ?.showSnackBar(const SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                      } else {
                        beritaModel.id = widget.beritaModel.id;
                        _apiService
                            .updateBeritaModel(beritaModel)
                            .then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(context);
                          } else {
                            scaffoldMessengerKey.currentState
                                ?.showSnackBar(const SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Submit".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue[500],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldJudul() {
    return TextField(
      controller: _controllerJudul,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Title",
        errorText: _isFieldJudulValid == null || _isFieldJudulValid!
            ? null
            : "Title is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldJudulValid) {
          setState(() => _isFieldJudulValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldDeskripsi() {
    return TextField(
      controller: _controllerDeskripsi,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Desdcription",
        errorText: _isFieldDeskripsiValid == null || _isFieldDeskripsiValid!
            ? null
            : "Descriptions is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldDeskripsiValid) {
          setState(() => _isFieldDeskripsiValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldImage() {
    return TextField(
      controller: _controllerImage,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Image",
        errorText: _isFieldImageValid == null || _isFieldImageValid!
            ? null
            : "Image is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldImageValid) {
          setState(() => _isFieldImageValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldUser() {
    return TextField(
      controller: _controllerUser,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "User Id",
        errorText: _isFieldUser_IdValid == null || _isFieldUser_IdValid!
            ? null
            : "User ID is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldUser_IdValid) {
          setState(() => _isFieldUser_IdValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldCategory() {
    return TextField(
      controller: _controllerCategory,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "User Id",
        errorText: _isFieldCategory_IdValid == null || _isFieldCategory_IdValid!
            ? null
            : "User ID is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldCategory_IdValid) {
          setState(() => _isFieldCategory_IdValid = isFieldValid);
        }
      },
    );
  }
}
