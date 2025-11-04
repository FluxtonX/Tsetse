import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';
import 'package:tsetse/views/authentication/permission.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  'Verification \nCode',
                  style: TextStyle(
                    fontSize: 34,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
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
                        'VERIFICATION',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please enter code send to;',
                        style: TextStyle(color: AppColors.subtittlecolor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Example@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,

                          fieldHeight: 70, // 👈 make taller if you want
                          fieldWidth: 40,
                          activeColor:
                              AppColors.Tsetsecolor, // active line color
                          inactiveColor:
                              AppColors.Tsetsecolor, // default line color
                          selectedColor: AppColors.Tsetsecolor, // when focused
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        animationDuration: const Duration(milliseconds: 200),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      ),

                      Text(
                        'Change Email Account',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 120),
                      Reusablebutton(
                        text: 'Continue',
                        backgroundColor: AppColors.Tsetsecolor,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Permission(),
                            ),
                          );
                        },
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
