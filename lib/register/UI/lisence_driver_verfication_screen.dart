import 'dart:io';

import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/register/common_widgets/common_button.dart';
import 'package:driver_register_app/register/common_widgets/common_register_container.dart';
import 'package:driver_register_app/register/common_widgets/custom_text_field.dart';
import 'package:driver_register_app/register/common_widgets/image_container.dart';
import 'package:driver_register_app/register/common_widgets/main_container.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:driver_register_app/utils/navigation_util.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:driver_register_app/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class LisenceDriverVerficationScreen extends StatefulWidget {
  const LisenceDriverVerficationScreen({super.key});

  @override
  State<LisenceDriverVerficationScreen> createState() =>
      _LisenceDriverVerficationScreenState();
}

class _LisenceDriverVerficationScreenState
    extends State<LisenceDriverVerficationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValidated = false;

  Future<void> _pickImage(String type) async {
    final ImagePicker _picker = ImagePicker();

    // Choose the source for the image (gallery or camera)
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (type == "LF") {
        setState(() {
          lisenceFront = pickedFile;
        });
      }
      if (type == "LB") {
        setState(() {
          lisenceBack = pickedFile;
        });
      }
      if (type == "DI") {
        setState(() {
          driverImg = pickedFile;
        });
      }
      if (type == "AI") {
        setState(() {
          additonalImg = pickedFile;
        });
      }
    }
  }

  XFile? lisenceFront;
  XFile? lisenceBack;
  XFile? driverImg;
  XFile? additonalImg;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return CommonRegisterContainer(
      progessStep: 2,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lisence Driver Details Submission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageContainer(
                  title: "Driving Lisence Front",
                  onTap: () {
                    _pickImage('LF');
                  },
                  image: lisenceFront,
                  context: context,
                  errorMsg: errorMessage,
                ),
                imageContainer(
                  title: "Driving Lisence Back",
                  onTap: () {
                    _pickImage('LB');
                  },
                  image: lisenceBack,
                  errorMsg: errorMessage,
                  context: context,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            imageContainer(
                title: "Driving Image",
                onTap: () {
                  _pickImage('DI');
                },
                image: driverImg,
                errorMsg: errorMessage,
                context: context),
            const SizedBox(
              height: 30.0,
            ),
            imageContainer(
              title: "Addional Document (Optional)",
              onTap: () {
                _pickImage('AI');
              },
              image: additonalImg,
              context: context,
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
    pushScreen(
      context,
      AppRoutes.toVehicleDetailsScreen,
    );
    if (lisenceFront != null && lisenceFront != null && driverImg != null) {
      final provider = Provider.of<DataProvider>(context, listen: false);
      provider.driverRegisterRequest?.driverLisenceInfo?.lisenceFront = lisenceFront;
      provider.driverRegisterRequest?.driverLisenceInfo?.lisenceBack = lisenceBack;
      provider.driverRegisterRequest?.driverLisenceInfo?.driverImg = driverImg;
      provider.driverRegisterRequest?.driverLisenceInfo?.additonalImg = additonalImg;
    } else {
      setState(() {
        errorMessage = "Image is Required!";
      });
    }
  }
}
