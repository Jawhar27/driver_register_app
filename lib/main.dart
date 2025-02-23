import 'package:driver_register_app/app_routes.dart';
import 'package:driver_register_app/register/UI/bank_details_screen.dart';
import 'package:driver_register_app/register/UI/driver_profile_screen.dart';
import 'package:driver_register_app/register/UI/registration_success_screen.dart';
import 'package:driver_register_app/register/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DriverProfileScreen(),
        onGenerateRoute: OnRouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

