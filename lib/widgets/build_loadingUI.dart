import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:weatherapp/widgets/dialouge_box.dart';

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
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              showSearchDialog(context);
            },
            icon: const Icon(Icons.search),
            label: const Text('Enter your city'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Rounded corners for the button
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0), // Padding around the button's content
            ),
          )
        ],
      ),
    ),
  );
}
