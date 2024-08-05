import 'package:flutter/material.dart';
import 'package:master_app/Dashboard/DashboardScreen.dart';
import 'package:master_app/splashScreen.dart';
import 'package:master_app/utility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // Set the theme of the application
      theme: ThemeData(
        primaryColor: mainThemeColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: mainThemeColor,
        ),

        buttonTheme: const ButtonThemeData(
          buttonColor: mainThemeColor,
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: mainThemeColor,
        ),
        // // You can add more theme customization here
      ),
      home: const SplashScreen(),
    );
  }
}


