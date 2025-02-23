import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/register/common_widgets/common_button.dart';
import 'package:driver_register_app/register/common_widgets/common_register_container.dart';
import 'package:driver_register_app/register/common_widgets/custom_dropdown_field.dart';
import 'package:driver_register_app/register/common_widgets/custom_text_field.dart';
import 'package:driver_register_app/register/common_widgets/main_container.dart';
import 'package:driver_register_app/register/models/driver_register_request.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:driver_register_app/utils/navigation_util.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:driver_register_app/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValidated = false;

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _accountHolderNameController =
      TextEditingController();
  String selectedBank = "Bank 1";
  @override
  Widget build(BuildContext context) {
    return CommonRegisterContainer(
      progessStep: 4,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bank Details Submission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomDropdownField(
              items: const [
                'Bank 1',
                'Bank 2',
                'Bank 3',
                'Bank 4',
              ],
              hintText: '',
              selectedValue: selectedBank,
              onChanged: (value) {
                setState(() {
                  selectedBank = value!;
                });
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Account Number',
              controller: _accountNumberController,
              validator: validateAccountNumber,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Branch',
              controller: _branchController,
              validator: validateNotEmpty,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: 'Account Holder Name',
              controller: _accountHolderNameController,
              validator: validateNotEmpty,
            ),
            const SizedBox(
              height: 50.0,
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
    if (_formKey.currentState?.validate() ?? false) {
      final provider = Provider.of<DataProvider>(context, listen: false);

      provider.addBankInfo(BankInfo(
        bank: selectedBank,
        accountHolderName: _accountHolderNameController.text,
        branch: _branchController.text,
        accountNumber: _accountNumberController.text,
      ));

      pushScreen(
        context,
        AppRoutes.toRegisterSuccessScreen,
      );
    }
  }
}
