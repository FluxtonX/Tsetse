import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/auth_provider.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/otp_screen.dart';
import 'package:tsetse/views/authentication/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emaiController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double titleSize = width < 360 ? 26 : 34;
    double logoSize = width < 360 ? 60 : 74;
    double topRadius = width < 360 ? 40 : 60;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: Column(
          children: [
            SizedBox(height: height * 0.04),

            /// Title
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome back\nSleep Fighter',
                  style: TextStyle(
                    fontSize: titleSize,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            /// Logo
            Container(
              height: logoSize,
              width: logoSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/fly2.png',
                  width: logoSize + 20,
                  height: logoSize + 20,
                ),
              ),
            ),

            SizedBox(height: height * 0.015),

            Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: height * 0.015),

            /// FORM AREA — Only this scrolls
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topRadius),
                    topRight: Radius.circular(topRadius),
                  ),
                ),

                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: width * 0.05,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.02),

                                Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: width < 360 ? 20 : 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.subtittlecolor,
                                  ),
                                ),

                                SizedBox(height: height * 0.01),

                                Text(
                                  'Please enter your Email & password to verify\n your account and get access.',
                                  style: TextStyle(
                                    color: AppColors.subtittlecolor,
                                    fontSize: width < 360 ? 12 : 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: height * 0.03),

                                /// INPUT FIELDS
                                ReusableTextField(
                                  controller: emaiController,
                                  hintText: 'Enter your Email',
                                  icon: Icons.email,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Plese Enter your Email';
                                    }
                                    if (!RegExp(
                                      r'\S+@\S+\.\S+',
                                    ).hasMatch(val)) {
                                      return 'Please Enter valid email';
                                    }
                                  },
                                ),

                                ReuseablePasswordfield(
                                  controller: passwordController,
                                  hintText: 'Enter your password',
                                  prefixIcon: Icons.lock,
                                  suffixIcon: Icons.remove_red_eye,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter your password';
                                    }
                                  },
                                ),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: width * 0.04,
                                    ),
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Color(0xFFFFB5B5),
                                        fontSize: width * 0.035,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: height * 0.04),

                                /// LOGIN BUTTON
                                authProvider.isLoading
                                    ? const CircularProgressIndicator()
                                    : Material(
                                        child: InkWell(
                                          enableFeedback: true,
                                          onTap: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final error =
                                                  await authProvider.Login(
                                                    emaiController.text.trim(),
                                                    passwordController.text
                                                        .trim(),
                                                  );

                                              if (error == null) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) => OtpScreen(),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(error),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 46,
                                            width: 196,
                                            decoration: BoxDecoration(
                                              color: AppColors.Tsetsecolor,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                SizedBox(height: height * 0.02),

                                /// SIGN UP LINK
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                RegistrationScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(
                                          color: AppColors.Tsetsecolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: height * 0.04),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
