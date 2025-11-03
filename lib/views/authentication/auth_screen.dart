import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/login_screen.dart';
import 'package:tsetse/views/authentication/registration_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                "Our AI alarm that refuses to let you sleep your life away..",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Align(
            //   alignment: FractionalOffset(0.9, 0.2),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 0),
            //     child: Transform.rotate(
            //       angle: 0,
            //       child: Image.asset('assets/icons/fly.png', height: 31),
            //     ),
            //   ),
            // ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 46,
                    width: 196,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(color: AppColors.white, width: 0.8),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: 0,
                  child: Image.asset('assets/icons/fly.png', height: 31),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 15),

                Reusablebutton(
                  text: 'Login',
                  backgroundColor: AppColors.textWhite,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 31),
              ],
            ),

            Align(
              alignment: FractionalOffset(0.1, 0.10),
              child: Transform.rotate(
                angle: 1,
                child: Image.asset('assets/icons/fly.png', height: 31),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reusablebutton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  const Reusablebutton({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: 196,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
