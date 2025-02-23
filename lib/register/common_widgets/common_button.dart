import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.cutomWidth,
    required this.buttonText,
    this.buttonTextStyle,
    this.customHeight,
    required this.onTap,
    this.buttonColor,
  });

  final double? cutomWidth;
  final double? customHeight;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final void Function()? onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cutomWidth ?? getDeviceWidth(context) * 0.8,
        height: customHeight ?? getDeviceHeight(context) * 0.06,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle ??
                TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
