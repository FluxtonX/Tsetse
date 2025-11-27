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
            colors: [AppColors.lightskyblue, AppColors.skyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  Image.asset(
                    'assets/images/fly2.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            const Text(
              "Welcome to TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Our AI alarm that refuses to let you sleep your life away..",
                style: TextStyle(
                  color: AppColors.subtittlecolor,
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
            SizedBox(height: 80),

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
                  border: Border.all(color: AppColors.Tsetsecolor, width: 0.8),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.Tsetsecolor,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Reusablebutton(
              text: 'Login',
              backgroundColor: AppColors.Tsetsecolor,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            SizedBox(width: 31),
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
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
