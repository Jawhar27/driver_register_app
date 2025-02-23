import 'package:driver_register_app/register/UI/bank_details_screen.dart';
import 'package:driver_register_app/register/UI/driver_profile_screen.dart';
import 'package:driver_register_app/register/UI/lisence_driver_verfication_screen.dart';
import 'package:driver_register_app/register/UI/registration_success_screen.dart';
import 'package:driver_register_app/register/UI/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String toSplashScreen = 'toSplashScreen';
  static const String toDriverProfileScreen = 'toDriverProfileScreen';

  static const String toLisenceDriverVerificationScreen =
      'toLisenceDriverVerificationScreen';
  static const String toVehicleDetailsScreen = "toVehicleDetailsScreen";
  static const String toBankDetailsScreen = "toBankDetailsScreen";
  static const String toRegisterSuccessScreen = "toRegisterSuccessScreen";
}

class OnRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.toDriverProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const DriverProfileScreen(),
        );

      case AppRoutes.toLisenceDriverVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const LisenceDriverVerficationScreen(),
        );

      case AppRoutes.toVehicleDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const VehicleDetailsScreen(),
        );

      case AppRoutes.toBankDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const BankDetailsScreen(),
        );

      case AppRoutes.toRegisterSuccessScreen:
        return MaterialPageRoute(
          builder: (_) => const RegistrationSuccessScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const DriverProfileScreen(),
        );
    }
  }
}
