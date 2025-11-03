import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.darkGreen, AppColors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: FractionalOffset(0.8, 0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Transform.rotate(
                  angle: 1,
                  child: Image.asset('assets/icons/fly.png', height: 31),
                ),
              ),
            ),
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.greenAccent.withOpacity(0.5), // glow color
                        BlendMode.srcATop,
                      ),
                      child: Image.asset(
                        'assets/icons/fly.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  Image.asset('assets/icons/fly.png', width: 100, height: 100),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "TSETSE",
              style: TextStyle(
                color: Color(0xFF00FF66),
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Your AI alarm that learns your \n sleep habits and won’t take \nsnooze for an answer.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: FractionalOffset(0.7, 0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Transform.rotate(
                  angle: 5.7,
                  child: Image.asset('assets/icons/fly.png', height: 31),
                ),
              ),
            ),
            // 🔵 Positioned image AFTER the column = appears on top
            Align(
              alignment: FractionalOffset(0.1, 0.10),
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Transform.rotate(
                  angle: 1,
                  child: Image.asset('assets/icons/fly.png', height: 31),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 36,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
