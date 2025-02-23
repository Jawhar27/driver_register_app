import 'dart:io';

import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/register/common_widgets/common_button.dart';
import 'package:driver_register_app/register/common_widgets/common_register_container.dart';
import 'package:driver_register_app/register/common_widgets/custom_text_field.dart';
import 'package:driver_register_app/register/common_widgets/image_container.dart';
import 'package:driver_register_app/register/common_widgets/main_container.dart';
import 'package:driver_register_app/register/models/driver_register_request.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:driver_register_app/utils/navigation_util.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:driver_register_app/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValidated = false;

  Future<void> _pickImage(String type) async {
    final ImagePicker _picker = ImagePicker();

    // Choose the source for the image (gallery or camera)
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (type == "VB") {
        setState(() {
          vehicleBook = pickedFile;
        });
      }
      if (type == "VF") {
        setState(() {
          vehicleFront = pickedFile;
        });
      }
      if (type == "VBB") {
        setState(() {
          vehicleBack = pickedFile;
        });
      }
      if (type == "ID") {
        setState(() {
          insuranceDoc = pickedFile;
        });
      }
      if (type == "IC") {
        setState(() {
          incomeCertificate = pickedFile;
        });
      }
    }
  }

  XFile? vehicleBook;
  XFile? incomeCertificate;
  XFile? insuranceDoc;
  XFile? vehicleFront;
  XFile? vehicleBack;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return CommonRegisterContainer(
      progessStep: 3,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehicle Details Submission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            imageContainer(
                title: "Vehicle Book Image",
                onTap: () {
                  _pickImage('VB');
                },
                image: vehicleBook,
                errorMsg: errorMessage,
                context: context),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageContainer(
                  title: "Income Certificate",
                  onTap: () {
                    _pickImage('IC');
                  },
                  image: incomeCertificate,
                  context: context,
                  errorMsg: errorMessage,
                ),
                imageContainer(
                  title: "Insurance Document",
                  onTap: () {
                    _pickImage('ID');
                  },
                  image: insuranceDoc,
                  errorMsg: errorMessage,
                  context: context,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageContainer(
                  title: "Vehicle Front Image",
                  onTap: () {
                    _pickImage('VF');
                  },
                  image: vehicleFront,
                  context: context,
                  errorMsg: errorMessage,
                ),
                imageContainer(
                  title: "Vehicle Back Image",
                  onTap: () {
                    _pickImage('VBB');
                  },
                  image: vehicleBack,
                  errorMsg: errorMessage,
                  context: context,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                  buttonText: "Previous",
                  cutomWidth: getDeviceWidth(context) * 0.4,
                  onTap: () {
                    popScreen(context);
                  },
                ),
                CommonButton(
                  buttonText: "Next",
                  onTap: _submit,
                  cutomWidth: getDeviceWidth(context) * 0.4,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _submit() {
    setState(() {
      _isFormValidated = true;
    });
    if (incomeCertificate != null &&
        insuranceDoc != null &&
        vehicleBack != null &&
        vehicleBook != null &&
        vehicleFront != null) {
      final provider = Provider.of<DataProvider>(context, listen: false);

      provider.addVehicleInfo(VehicleInfo(
        vehicleFront: vehicleFront,
        vehicleBack: vehicleBack,
        vehicleBook: vehicleBook,
        insuranceDoc: insuranceDoc,
        incomeCertificate: incomeCertificate,
      ));

      pushScreen(
        context,
        AppRoutes.toBankDetailsScreen,
      );
    } else {
      setState(() {
        errorMessage = "Image is Required!";
      });
    }
  }
}
