import 'package:doctor_appointment/Constants/AppColor.dart';
import 'package:flutter/material.dart';
import 'doctor_list.dart'; // Import the color palette

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Navigate to DoctorListScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DoctorList()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo or splash screen image
            Image.asset('assets/splash.png', height: 200, width: 200),
            const SizedBox(height: 20),
            // Splash screen title or text
            const Text(
              'Welcome to Doctor App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.cardBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

