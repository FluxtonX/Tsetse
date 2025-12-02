import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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

        /// ⭐ FIX: Make the Column scrollable
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: height, // so content stays centered
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MAIN ICON
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

                SizedBox(height: max(height * 0.025, 15)),

                Text(
                  "TSETSE",
                  style: TextStyle(
                    color: AppColors.Tsetsecolor,
                    fontSize: max(width * 0.11, 32),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: max(height * 0.01, 6)),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: max(width * 0.1, 24),
                  ),
                  child: Text(
                    "Your AI alarm that learns your \n sleep habits and won’t take \nsnooze for an answer.",
                    style: TextStyle(
                      color: AppColors.subtittlecolor,
                      fontSize: max(width * 0.045, 14),
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: max(height * 0.09, 40)),
                  child: Material(
                    borderRadius: BorderRadius.circular(max(width * 0.05, 18)),
                    color: AppColors.Tsetsecolor,
                    child: InkWell(
                      enableFeedback: true,

                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: max(width * 0.25, 80),
                        height: max(height * 0.06, 35),
                        decoration: BoxDecoration(
                          color: AppColors.Tsetsecolor,
                          borderRadius: BorderRadius.circular(
                            max(width * 0.05, 18),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: max(width * 0.09, 28),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
