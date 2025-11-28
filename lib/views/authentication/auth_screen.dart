import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/login_screen.dart';
import 'package:tsetse/views/authentication/registration_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightskyblue, AppColors.skyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        /// ⭐ Prevent overflow in landscape
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO CONTAINER
                Container(
                  height: max(height * 0.18, 120),
                  width: max(width * 0.38, 120),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(max(width * 0.08, 20)),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/fly2.png',
                      width: max(width * 0.25, 80),
                      height: max(height * 0.12, 80),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: max(height * 0.025, 20)),

                Text(
                  "TSETSE",
                  style: TextStyle(
                    color: AppColors.Tsetsecolor,
                    fontSize: max(width * 0.11, 32),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: max(height * 0.03, 30)),

                Text(
                  "Welcome to TSETSE",
                  style: TextStyle(
                    color: AppColors.Tsetsecolor,
                    fontSize: max(width * 0.06, 20),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: max(height * 0.01, 10)),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: max(width * 0.1, 24),
                  ),
                  child: Text(
                    "Our AI alarm that refuses to let you sleep your life away..",
                    style: TextStyle(
                      color: AppColors.subtittlecolor,
                      fontSize: max(width * 0.04, 14),
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: max(height * 0.1, 40)),

                // REGISTER BUTTON
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
                    height: max(height * 0.06, 42),
                    width: max(width * 0.52, 180),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        color: AppColors.Tsetsecolor,
                        width: 0.8,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: max(width * 0.04, 14),
                          fontWeight: FontWeight.w600,
                          color: AppColors.Tsetsecolor,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: max(height * 0.02, 15)),

                // LOGIN BUTTON
                Reusablebutton(
                  text: 'Login',
                  backgroundColor: AppColors.Tsetsecolor,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),

                SizedBox(height: max(height * 0.03, 30)),
              ],
            ),
          ),
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: max(height * 0.06, 42),
        width: max(width * 0.52, 180),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: max(width * 0.04, 14),
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
