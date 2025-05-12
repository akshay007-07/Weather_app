import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildErrorUI() {
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
          ),
          // const SizedBox(height: 16),
          const Text(
            'Enter a valid city',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 18, // Increase the font size
            ),
          )
        ],
      ),
    ),
  );
}
