import 'package:flutter/material.dart';
import 'package:master_app/my_helpers/helps/navigator_help.dart';
import 'package:master_app/sliderScreens/firstScreen.dart';
import 'package:master_app/utility.dart'; // Assuming mainThemeColor is defined in utility.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to the Firstscreen
    Future.delayed(const Duration(seconds: 2), () {
      navigatorPush(Firstscreen(), context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainThemeColor,
            mainThemeColor.withOpacity(0.5), // Slightly darker intermediate color for a smoother transition
            Colors.black.withOpacity(0.9),   // Lighter black color
          ],
          stops: const [0.0, 0.7, 1.0],      // Adjusted stops for a better gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/Rectangle_4__1_-removebg-preview.png',
          width: 200, // Adjust width and height as needed
          height: 200,
        ),
      ),
    );
  }
}
