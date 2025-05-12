import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _navigateToHomeScreen(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return buildLoadingUI(context);
        },
      ),
    );
  }

  Future<void> _navigateToHomeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const Homescreen(), 
      ),
    );
  }

  Widget buildLoadingUI(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/animation.json',
                repeat: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
