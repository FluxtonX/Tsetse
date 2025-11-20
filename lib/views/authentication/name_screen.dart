import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/reusbale_textfield.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';
import 'package:tsetse/views/authentication/permission.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
    final nameController = TextEditingController();


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
                  'Let’s Get Personal',
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
                  'TSETSE needs your name — so it \nknows who to yell at in the morning.',
                  style: TextStyle(
                    fontSize: 18,
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
                        'Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'What should TSETSE call you?',
                        style: TextStyle(color: AppColors.subtittlecolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),

                      ReusableTextField(
                        controller: nameController,
                        hintText: 'Name', icon: Icons.person),

                      const SizedBox(height: 200),
                      Reusablebutton(
                        text: 'Next',
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
