import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/utils/print_log.dart';
import 'package:flutter/material.dart';


Future pushScreen(BuildContext context, String route,
    {Object? arguments}) async {
  return await Navigator.of(context).pushNamed(route, arguments: arguments);
}

void moveToHome(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRoutes.toDriverProfileScreen, (route) => false);
}

void popScreen(BuildContext context, {result}) {
  Navigator.of(context).pop(result);
}

void moveToScreen(BuildContext context, String route, {Map? arguments}) {
  if (context.mounted) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
      arguments: arguments ?? {},
    );
  } else {
    printLogs("Error: Route is null or empty.");
  }
}
