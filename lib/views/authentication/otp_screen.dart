import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';
import 'package:tsetse/views/authentication/permission.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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

                // Top Text
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      'Verification \nCode',
                      style: TextStyle(
                        fontSize: width * 0.085,
                        color: AppColors.Tsetsecolor,
                        fontWeight: FontWeight.bold,
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

                // White bottom sheet
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
                          'VERIFICATION',
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: AppColors.subtittlecolor,
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        Text(
                          'Please enter code sent to:',
                          style: TextStyle(
                            color: AppColors.subtittlecolor,
                            fontSize: width * 0.035,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          'Example@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: height * 0.02),

                        // PIN Code Fields
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: height * 0.08,
                            fieldWidth: width * 0.12,
                            activeColor: AppColors.Tsetsecolor,
                            inactiveColor: AppColors.Tsetsecolor,
                            selectedColor: AppColors.Tsetsecolor,
                          ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          animationDuration: const Duration(milliseconds: 200),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                        ),

                        SizedBox(height: height * 0.015),

                        Text(
                          'Change Email Account',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: width * 0.035,
                          ),
                        ),

                        SizedBox(height: height * 0.08),

                        // Continue Button
                        Reusablebutton(
                          text: 'Continue',
                          backgroundColor: AppColors.Tsetsecolor,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PermissionScreen(),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: height * 0.04),
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
