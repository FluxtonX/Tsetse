import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';
import 'package:tsetse/views/authentication/otp_screen.dart';
import 'package:tsetse/views/authentication/firebaseauthenrication_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();

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
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: Column(
              children: [
                SizedBox(height: height * 0.06),

                // Top Welcome Text
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: width * 0.085,
                        color: AppColors.Tsetsecolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      'Sleep Fighter',
                      style: TextStyle(
                        fontSize: width * 0.06,
                        color: AppColors.subtittlecolor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.06),

                // Logo
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/fly2.png',
                      width: width * 0.15,
                      height: width * 0.15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text(
                  "TSETSE",
                  style: TextStyle(
                    color: AppColors.Tsetsecolor,
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: height * 0.03),

                // White Bottom Sheet
                Container(
                  width: width,
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.03),

                        Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: AppColors.subtittlecolor,
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        Text(
                          'Please enter your Email & password to verify\n your account and get access.',
                          style: TextStyle(
                            color: AppColors.subtittlecolor,
                            fontSize: width * 0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: height * 0.02),

                        // Form Fields
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

                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.08),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 181, 181, 1),
                                fontSize: width * 0.035,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.04),

                        // Login Button
                        Reusablebutton(
                          text: 'Login',
                          backgroundColor: AppColors.Tsetsecolor,
                          onTap: () {
                            SignInWithEmialandPassword(
                              emaiController.text,
                              passwordController.text,
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: height * 0.02),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: width * 0.035,
                              ),
                            ),
                            Text(
                              'Sign up',
                              style: TextStyle(
                                color: AppColors.Tsetsecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ],
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
