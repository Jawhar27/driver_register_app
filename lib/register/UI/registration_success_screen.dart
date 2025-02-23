import 'package:driver_register_app/register/common_widgets/common_button.dart';
import 'package:driver_register_app/register/common_widgets/common_register_container.dart';
import 'package:driver_register_app/register/common_widgets/image_container.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationSuccessScreen extends StatefulWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  State<RegistrationSuccessScreen> createState() =>
      _RegistrationSuccessScreenState();
}

class _RegistrationSuccessScreenState extends State<RegistrationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    return CommonRegisterContainer(
        progessStep: 5,
        child: SizedBox(
          width: getDeviceWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading("Driver Details"),
              _divider(),
              _fieldWithValue(
                  title: "Name",
                  value: provider.driverRegisterRequest.personalInfo?.name ??
                      "Name"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Email",
                  value: provider.driverRegisterRequest.personalInfo?.email ??
                      "Email"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Mobile",
                  value: provider.driverRegisterRequest.personalInfo?.mobile ??
                      "Mobile"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "NIC",
                  value: provider.driverRegisterRequest.personalInfo?.nic ??
                      "Nic"),
              _divider(),
              _heading("License Driver Details"),
              _divider(
                size: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageContainer(
                    title: "Driver Lisence Front",
                    context: context,
                    image: provider
                        .driverRegisterRequest.driverLisenceInfo?.lisenceFront,
                  ),
                  imageContainer(
                    title: "Driver Lisence Back",
                    context: context,
                    image: provider
                        .driverRegisterRequest.driverLisenceInfo?.lisenceBack,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageContainer(
                    title: "Driver Image",
                    context: context,
                    image: provider
                        .driverRegisterRequest.driverLisenceInfo?.driverImg,
                  ),
                  imageContainer(
                    title: "Additional Document",
                    context: context,
                    image: provider
                        .driverRegisterRequest.driverLisenceInfo?.additonalImg,
                  ),
                ],
              ),
              _divider(),
              _heading("Vehicle Details"),
              _divider(
                size: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageContainer(
                    title: "Vehicle Book",
                    context: context,
                    image: provider
                        .driverRegisterRequest.vehicleInfo?.vehicleBook,
                  ),
                  imageContainer(
                    title: "Income Certificate",
                    context: context,
                    image: provider
                        .driverRegisterRequest.vehicleInfo?.incomeCertificate,
                  ),
                ],
              ),
              imageContainer(
                title: "Insurance Document",
                context: context,
                image:
                    provider.driverRegisterRequest.vehicleInfo?.insuranceDoc,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageContainer(
                    title: "Vehicle Front",
                    context: context,
                    image: provider
                        .driverRegisterRequest.vehicleInfo?.vehicleFront,
                  ),
                  imageContainer(
                    title: "Vehicle Back",
                    context: context,
                    image: provider
                        .driverRegisterRequest.vehicleInfo?.vehicleBack,
                  ),
                ],
              ),
              _divider(),
              _heading("Bank Details"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Account Holder Name",
                  value: provider
                          .driverRegisterRequest.bankInfo?.accountHolderName ??
                      "Account holder"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Account Number",
                  value:
                      provider.driverRegisterRequest.bankInfo?.accountNumber ??
                          "Account Number"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Bank",
                  value:
                      provider.driverRegisterRequest.bankInfo?.bank ?? "Bank"),
              _divider(
                size: 10,
              ),
              _fieldWithValue(
                  title: "Branch",
                  value:
                      provider.driverRegisterRequest.bankInfo?.branch ?? "Bank"),
              _divider(
                size: 40,
              ),
              Center(
                child: CommonButton(
                  buttonText: "Go to Dashboard",
                  onTap: () {},
                ),
              )
            ],
          ),
        ));
  }

  _heading(String heading) {
    return Text(
      heading,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _divider({double? size = 20}) {
    return SizedBox(
      height: size ?? 20,
    );
  }

  _fieldWithValue({required String title, required String value}) {
    return Text(
      '$title - $value',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
