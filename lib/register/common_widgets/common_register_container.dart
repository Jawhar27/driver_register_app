import 'package:driver_register_app/app_colors.dart';
import 'package:driver_register_app/register/common_widgets/main_container.dart';
import 'package:driver_register_app/utils/screen_util.dart';
import 'package:flutter/material.dart';

class CommonRegisterContainer extends StatelessWidget {
  const CommonRegisterContainer({
    super.key,
    required this.child,
    required this.progessStep,
  });

  final Widget child;
  final int progessStep;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        isSafeAreaNeeded: true,
        enableScrolling: true,
        resizeToAvoidBottomInset: true,
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  progessStep == 5
                      ? 'Driver Registration Completed'
                      : 'Driver Registration Process',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                _progress(context),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            child,
          ],
        ));
  }

  _progress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index + 1 <= progessStep
                ? AppColors.green
                : AppColors.borderGrey,
          ),
          width: getDeviceWidth(context) * 0.12,
          height: 10,
        );
      }),
    );
  }
}
