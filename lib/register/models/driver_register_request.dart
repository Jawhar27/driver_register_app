import 'package:image_picker/image_picker.dart';

class DriverRegisterRequest {
  PersonalInfo? personalInfo;
  DriverLisenceInfo? driverLisenceInfo;
  VehicleInfo? vehicleInfo;
  BankInfo? bankInfo;
}

class DriverLisenceInfo {
  XFile? lisenceFront;
  XFile? lisenceBack;
  XFile? driverImg;
  XFile? additonalImg;
}

class PersonalInfo {
  String? name;
  String? mobile;
  String? email;
  String? nic;
}

class VehicleInfo {
  XFile? vehicleBook;
  XFile? incomeCertificate;
  XFile? insuranceDoc;
  XFile? vehicleFront;
  XFile? vehicleBack;
}

class BankInfo{
  String? bank;
  String? branch;
  String? accountNumber;
  String? accountHolderName;
}
