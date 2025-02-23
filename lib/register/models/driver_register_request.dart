import 'package:image_picker/image_picker.dart';

class DriverRegisterRequest {
  PersonalInfo? personalInfo;
  DriverLisenceInfo? driverLisenceInfo;
  VehicleInfo? vehicleInfo;
  BankInfo? bankInfo;

  DriverRegisterRequest({
    this.personalInfo,
    this.driverLisenceInfo,
    this.vehicleInfo,
    this.bankInfo,
  });
}

class DriverLisenceInfo {
  XFile? lisenceFront;
  XFile? lisenceBack;
  XFile? driverImg;
  XFile? additonalImg;

  DriverLisenceInfo({
    this.lisenceFront,
    this.lisenceBack,
    this.driverImg,
    this.additonalImg,
  });
}

class PersonalInfo {
  String? name;
  String? mobile;
  String? email;
  String? nic;

  PersonalInfo({
    this.name,
    this.mobile,
    this.email,
    this.nic,
  });
}

class VehicleInfo {
  XFile? vehicleBook;
  XFile? incomeCertificate;
  XFile? insuranceDoc;
  XFile? vehicleFront;
  XFile? vehicleBack;

  VehicleInfo({
    this.vehicleBook,
    this.incomeCertificate,
    this.insuranceDoc,
    this.vehicleFront,
    this.vehicleBack,
  });
}

class BankInfo {
  String? bank;
  String? branch;
  String? accountNumber;
  String? accountHolderName;

  BankInfo({
    this.bank,
    this.branch,
    this.accountNumber,
    this.accountHolderName,
  });
}
