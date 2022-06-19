import 'package:flutter/material.dart';
import '../models/vaccine_model.dart';

class VaccineProvider with ChangeNotifier {
  List<VaccineModel> _vaccineList = [];
  List<VaccineModel> get vaccineList => _vaccineList;
  void addVaccine(VaccineModel vaccine) {
    _vaccineList.add(vaccine);
    notifyListeners();
  }

  void removeVaccine(VaccineModel vaccine) {
    _vaccineList = vaccineList.where((item) => item.id != vaccine.id).toList();
    notifyListeners();
  }

  void updateVaccine(VaccineModel vaccine){
    _vaccineList[_vaccineList.indexWhere((item) => item.id == vaccine.id)] = vaccine;
    notifyListeners();
  }
}
