import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';

import 'package:tsetse/views/authentication/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 34,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sleep Fighter',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.subtittlecolor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 65),

            Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/icons/fly2.png', width: 100, height: 100),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
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
                        'Log in',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please enter your Email & password to verify\n your account get access.',
                        style: TextStyle(color: AppColors.subtittlecolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),

                      ReusableTextField(
                        hintText: 'Enter your Email',
                        icon: Icons.email,
                      ),
                      ReuseablePasswordfield(
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 181, 181, 1),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),
                      Reusablebutton(
                        text: 'Login',
                        backgroundColor: AppColors.Tsetsecolor,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtpScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Dont have an account? ',
                            style: TextStyle(
                              color: Color.fromRGBO(154, 154, 154, 1),
                            ),
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.Tsetsecolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
