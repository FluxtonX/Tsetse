import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';
import 'package:tsetse/views/authentication/firebaseauthenrication_Screen.dart';

import 'package:tsetse/views/authentication/otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();

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
                  'Let’s Get You \nStarted',
                  style: TextStyle(
                    fontSize: 34,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

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
                        'Register Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create a new account to get started and enjoy \nTSETSE app access to our features',
                        style: TextStyle(color: AppColors.subtittlecolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ReusableTextField(
                        controller: nameController,
                        hintText: 'Name',
                        icon: Icons.person,
                      ),
                      ReusableTextField(
                        controller: emaiController,
                        hintText: 'Enter your Email',
                        icon: Icons.email,
                      ),
                      ReuseablePasswordfield(
                        controller: passwordController,

                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),
                      ReuseablePasswordfield(
                        controller: passwordController,
                        hintText: 'Confirm Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                      ),

                      const SizedBox(height: 40),
                      Reusablebutton(
                        text: 'Signup',
                        backgroundColor: AppColors.Tsetsecolor,
                        onTap: () {
                          setState(() {
                            if (emaiController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please Fill all Fields'),
                                ),
                              );
                              return;
                            } else {
                              signUpWithEmailPassword(
                                emaiController.text.trim(),
                                passwordController.text.trim(),
                                nameController.text,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OtpScreen(),
                                ),
                              );
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Already have account? ',
                            style: TextStyle(
                              color: Color.fromRGBO(154, 154, 154, 1),
                            ),
                          ),
                          Text(
                            'Login',
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
