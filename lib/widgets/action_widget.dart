import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/vaccine_model.dart';
import '../providers/vaccine_provider.dart';
import '../widgets/detail_widget.dart';
import '../widgets/action_widget.dart';

class ActionWidget extends StatelessWidget {
  final String nama;
  final String nik;
  final VaccineModel? vaccine;
  const ActionWidget(
      {Key? key, required this.nama, required this.nik, this.vaccine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _namaController = TextEditingController();
    TextEditingController _nikController = TextEditingController();
    if (vaccine != null) {
      _namaController.text = vaccine!.nama;
      _nikController.text = vaccine!.nik;
    }
    return AlertDialog(
      title: const Text('Judul'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: InputBorder.none,
                filled: true,
                isDense: true,
                fillColor: Colors.grey,
                hintText: "Masukan Nama",
              ),
            ),
            TextField(
              controller: _nikController,
              decoration: const InputDecoration(
                labelText: 'NIK',
                border: InputBorder.none,
                filled: true,
                isDense: true,
                fillColor: Colors.grey,
                hintText: "Masukan NIK",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            if (_namaController.text.isEmpty && _nikController.text.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('Error'),
                      content: Text('tidak boleh kosong'),
                    );
                  });
            } else {
              if (vaccine != null) {
                Provider.of<VaccineProvider>(
                  context,
                  listen: false,
                ).updateVaccine(
                  VaccineModel(
                    id: vaccine!.id,
                    nama: _namaController.text,
                    nik: _nikController.text,
                  ),
                );
              } else {
                const uuid = Uuid();

                Provider.of<VaccineProvider>(context, listen: false).addVaccine(
                  VaccineModel(
                      id: uuid.v4(),
                      nama: _namaController.text,
                      nik: _nikController.text),
                );
              }

              Navigator.pop(context);
            }
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
