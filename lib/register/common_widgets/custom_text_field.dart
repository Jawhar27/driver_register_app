import 'package:driver_register_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final double? borderRadius;
  final bool isEnabled;
  final bool isSearchBar;
  final int? maxLines;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.borderRadius,
    this.isEnabled = true,
    this.isSearchBar = false,
    this.maxLines = 1,
    this.keyboardType,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      enabled: isEnabled,
      focusNode: focusNode,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 0.0),
        ),
        filled: true,
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.green, width: 2.0),
        ),
        // error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        suffixIcon: isSearchBar ? const Icon(Icons.search) : null,
      ),
    );
  }
}
