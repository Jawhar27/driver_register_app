import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/register/common_widgets/common_button.dart';
import 'package:driver_register_app/register/common_widgets/common_register_container.dart';
import 'package:driver_register_app/register/common_widgets/custom_text_field.dart';
import 'package:driver_register_app/register/common_widgets/main_container.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:driver_register_app/utils/navigation_util.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:driver_register_app/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValidated = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonRegisterContainer(
      progessStep: 1,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Driver Details Submission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Name',
              controller: _nameController,
              validator: validateName,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Email Address',
              controller: _emailController,
              validator: validateEmail,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Mobile Number',
              controller: _mobileController,
              validator: validateMobile,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'NIC No',
              controller: _nicController,
              validator: validateNIC,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: CommonButton(
                buttonText: "Next",
                onTap: _submit,
              ),
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
    if (_formKey.currentState?.validate() ?? false) {
      final provider = Provider.of<DataProvider>(context, listen: false);
      provider.driverRegisterRequest?.personalInfo?.email = _emailController.text;
      provider.driverRegisterRequest?.personalInfo?.name = _nameController.text;
      provider.driverRegisterRequest?.personalInfo?.mobile = _mobileController.text;
      provider.driverRegisterRequest?.personalInfo?.nic = _nicController.text;

      pushScreen(
        context,
        AppRoutes.toLisenceDriverVerificationScreen,
      );
    }
  }
}
