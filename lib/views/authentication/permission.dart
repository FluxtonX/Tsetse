import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/buildPermission_tile.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/alerttime_screen.dart';
import 'package:tsetse/views/authentication/auth_screen.dart'
    show Reusablebutton;


class Permission extends StatelessWidget {
  const Permission({super.key});

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
                  'Permissions \nSetup',
                  style: TextStyle(
                    fontSize: 34,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

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
                        'Permissions Setup',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We need these to help you wake up',
                        style: TextStyle(color: AppColors.subtittlecolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      buildPermissionTile(
                        icon: Icons.camera_alt,
                        title: "Camera",
                        subtitle: "To verify your wake up selfies",
                        value: true,
                        color: AppColors.Tsetsecolor,
                      ),
                      buildPermissionTile(
                        icon: Icons.notifications_none,
                        title: "Notification",
                        subtitle: "For pre alarm reminders",
                        value: false,
                        color: AppColors.Tsetsecolor,
                      ),
                      buildPermissionTile(
                        icon: Icons.location_on_outlined,
                        title: "Location",
                        subtitle: "To alert your Buzz buddy if you oversleep",
                        value: false,
                        color: AppColors.Tsetsecolor,
                      ),
                      buildPermissionTile(
                        icon: Icons.phone,
                        title: "Contacts",
                        subtitle: "To connect your Buzz buddy",
                        value: false,
                        color: AppColors.Tsetsecolor,
                      ),
                      SizedBox(height: 60),

                      Reusablebutton(
                        text: 'Next',
                        backgroundColor: AppColors.Tsetsecolor,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AlarmTimeScreen(),
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


