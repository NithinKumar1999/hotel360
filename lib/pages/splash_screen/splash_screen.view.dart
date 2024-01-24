import 'package:flutter/material.dart';
import 'package:hotel_app/pages/login_page/login_page.view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add a delay of 2 seconds (adjust as needed)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginPageView()), // Replace HomeScreen with your main screen
      );
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage('assets/hotel_splash.gif'),
            ),
            SizedBox(height: 30),
            Text(
              'Hotel 360',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(221, 152, 5, 160),
              ),
            )
          ],
        ),
      ),
    );
  }
}
