import 'package:driver_register_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String hintText;
  final double? borderRadius;
  final String? dropdownValue;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDropdownField({
    super.key,
    required this.items,
    this.selectedValue,
    this.onChanged,
    required this.hintText,
    this.borderRadius,
    this.dropdownValue,
    this.enabled = true,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          borderSide: const BorderSide(color: AppColors.green, width: 0.0),
        ),
        filled: true,
        enabled: enabled,
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.green, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.red, width: 2.0),
        ),
        contentPadding: contentPadding,
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
