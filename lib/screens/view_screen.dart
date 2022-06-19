import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vaccine_provider.dart';
import '../widgets/action_widget.dart';

class VaccinePage extends StatelessWidget {
  const VaccinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine'),
      ),
      body:
          Consumer<VaccineProvider>(builder: (context, vaccineProvider, child) {
        return ListView(
          padding: const EdgeInsets.all(20.0),
          children: vaccineProvider.vaccineList.isNotEmpty
              ? vaccineProvider.vaccineList.map(
                  (vaccine) {
                    return Dismissible(
                      key: Key(vaccine.id),
                      background: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Hapus',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(vaccine.nama),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ActionWidget(
                                  nama: 'Nama',
                                  nik: 'NIK',
                                  vaccine: vaccine,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<VaccineProvider>(
                          context,
                          listen: false,
                        ).removeVaccine(vaccine);
                      },
                    );
                  },
                ).toList()
              : [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Text(
                      "masih kosong",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const ActionWidget(nama: "Tambah", nik: "123456789");
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
