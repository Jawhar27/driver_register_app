import 'package:driver_register_app/register/models/driver_register_request.dart';
import 'package:driver_register_app/utils/print_log.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  DriverRegisterRequest driverRegisterRequest = DriverRegisterRequest();

  addPersonalInfo(PersonalInfo personalInfo) {
    printLogs('Adding Personal Info');
    driverRegisterRequest.personalInfo = personalInfo;
    notifyListeners();
  }

  addLisenceInfo(DriverLisenceInfo driverLisenceInfo) {
    printLogs('Adding Lisence Info');
    driverRegisterRequest.driverLisenceInfo = driverLisenceInfo;
    notifyListeners();
  }

  addVehicleInfo(VehicleInfo vehicleInfo) {
    printLogs('Adding vehicle Info');
    driverRegisterRequest.vehicleInfo = vehicleInfo;
    notifyListeners();
  }

  addBankInfo(BankInfo bankInfo) {
    printLogs('Adding Bank Info');
    driverRegisterRequest.bankInfo = bankInfo;
    notifyListeners();
  }
}
