import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/auth_provider.dart';
import 'package:tsetse/Providers/confirmvisibility_provider.dart';
import 'package:tsetse/Providers/passwordvissibility_provider.dart';
import 'package:tsetse/Widgets/confirm_password.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/Widgets/reuseable_passwordfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/Home_screen.dart';
import 'package:tsetse/views/authentication/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final nameController = TextEditingController();

  final emaiController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmcontroller = TextEditingController();

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

            /// Heading
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Let’s Get You \nStarted',
                  style: TextStyle(
                    fontSize: titleSize,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

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

            SizedBox(height: height * 0.01),

            Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: height * 0.015),

            /// FORM CONTAINER
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

                /// SCROLL ONLY INSIDE WHITE CONTAINER
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
                                SizedBox(height: height * 0.015),

                                Text(
                                  'Register Account',
                                  style: TextStyle(
                                    fontSize: width < 360 ? 20 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.subtittlecolor,
                                  ),
                                ),

                                SizedBox(height: height * 0.01),

                                Text(
                                  'Create a new account to get started and enjoy '
                                  'TSETSE app access to our features.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.subtittlecolor,
                                    fontSize: width < 360 ? 12 : 14,
                                  ),
                                ),

                                SizedBox(height: height * 0.03),

                                /// INPUTS
                                ReusableTextField(
                                  controller: nameController,
                                  hintText: 'Name',
                                  icon: Icons.person,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please Enter Your Name';
                                    }
                                    return null;
                                  },
                                ),
                                ReusableTextField(
                                  controller: emaiController,
                                  hintText: 'Enter your Email',
                                  icon: Icons.email,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'please enter your email';
                                    }
                                    if (!RegExp(
                                      r'\S+@\S+\.\S+',
                                    ).hasMatch(val)) {
                                      return 'Please Enter Correct email';
                                    }
                                  },
                                ),
                                ReuseablePasswordfield(
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please Enter your Password';
                                    }
                                  },
                                  controller: passwordController,
                                  hintText: 'Enter your password',
                                  prefixIcon: Icons.lock,
                                  suffixIcon: Icons.remove_red_eye,
                                ),
                                ConfirmPassword(
                                  hintText: 'Confirm Password',
                                  prefixIcon: Icons.lock,
                                  controller: confirmcontroller,
                                  suffixIcon: Icons.remove_red_eye,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (val != passwordController) {
                                      return 'PAssword do not match';
                                    }
                                  },
                                ),

                                SizedBox(height: height * 0.04),

                                /// BUTTON
                                authProvider.isLoading
                                    ? CircularProgressIndicator()
                                    : GestureDetector(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final error = await authProvider
                                                .signup(
                                                  nameController.text.trim(),
                                                  emaiController.text.trim(),
                                                  passwordController.text
                                                      .trim(),
                                                );

                                            if (error == null) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => HomeScreen(),
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(content: Text(error)),
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: 46,
                                          width: 196,

                                          decoration: BoxDecoration(
                                            color: AppColors.Tsetsecolor,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Signup",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                SizedBox(height: height * 0.02),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account? ',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: AppColors.Tsetsecolor,
                                          fontWeight: FontWeight.bold,
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
