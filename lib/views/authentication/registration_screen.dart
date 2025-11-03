import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Lets Get You \nStarted ',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Row(
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
              ],
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
            // Spacer(),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Register Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Create a new account to get started and enjoy\napp access to our features',
                        style: TextStyle(color: Colors.grey),
                      ),
                      ReusableTextField(hintText: 'Name', icon: Icons.person),
                      ReusableTextField(
                        hintText: 'Enter your Email',
                        icon: Icons.email,
                      ),
                      ReuseablePasswordfield(
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),
                      ReuseablePasswordfield(
                        hintText: 'Confirm Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),

                      Reusablebutton(
                        text: 'Signup',
                        backgroundColor: AppColors.lightGreen,
                        onTap: () {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have account? '),
                          Text('Login'),

                          SizedBox(height: 100),
                        ],
                      ),
                    ],
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
