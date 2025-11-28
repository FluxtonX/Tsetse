import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tsetse/Widgets/buildPermission_tile.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/alerttime_screen.dart';
import 'package:tsetse/views/authentication/auth_screen.dart'
    show Reusablebutton;
import 'package:tsetse/views/authentication/firebaseauthenrication_Screen.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool cameraGranted = false;
  bool notificationGranted = false;
  bool locationGranted = false;
  bool contactsGranted = false;

  Future<void> requestcameraPermission() async {
    var status = await Permission.camera.request();
    setState(() {
      cameraGranted = status.isGranted;
    });
  }

  Future<void> notificationRequest() async {
    var status = await Permission.notification.request();
    setState(() {
      notificationGranted = status.isGranted;
    });
  }

  Future<void> locationPermission() async {
    var status = await Permission.location.request();
    setState(() {
      locationGranted = status.isGranted;
    });
  }

  Future<void> contactsPermission() async {
    final status = await Permission.contacts.request();
    if (status.isDenied) {
      await Permission.contacts.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    setState(() {
      contactsGranted = status.isGranted;
    });
  }

  Future<void> allowAllPermissions() async {
    var camera = await Permission.camera.request();
    var notification = await Permission.notification.request();
    var location = await Permission.location.request();
    var contacts = await Permission.contacts.request();

    setState(() {
      cameraGranted = camera.isGranted;
      notificationGranted = notification.isGranted;
      locationGranted = location.isGranted;
      contactsGranted = contacts.isGranted;
    });
  }

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
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Permissions \nSetup',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      color: AppColors.Tsetsecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      signOutUser();
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: AppColors.Tsetsecolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              height: height * 0.1,
              width: width * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/fly2.png',
                  width: width * 0.12,
                  height: width * 0.12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: width * 0.08,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: height * 0.015),
            Expanded(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.15),
                    topRight: Radius.circular(width * 0.15),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.03),
                        Text(
                          'Permission',
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: AppColors.subtittlecolor,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          'We need these to help you wake up',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: AppColors.subtittlecolor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.02),
                        buildPermissionTile(
                          icon: Icons.camera_alt,
                          title: "Camera",
                          subtitle: "To verify your wake up selfies",
                          value: cameraGranted,
                          color: AppColors.Tsetsecolor,
                          onTap: requestcameraPermission,
                          context: context,
                        ),
                        SizedBox(height: height * 0.015),
                        buildPermissionTile(
                          icon: Icons.notifications_none,
                          title: "Notification",
                          subtitle: "For pre alarm reminders",
                          value: notificationGranted,
                          color: AppColors.Tsetsecolor,
                          onTap: notificationRequest,
                          context: context,
                        ),
                        SizedBox(height: height * 0.015),
                        buildPermissionTile(
                          icon: Icons.location_on_outlined,
                          title: "Location",
                          subtitle: "To alert your Buzz buddy if you oversleep",
                          value: locationGranted,
                          color: AppColors.Tsetsecolor,
                          onTap: locationPermission,
                          context: context,
                        ),
                        SizedBox(height: height * 0.015),
                        buildPermissionTile(
                          icon: Icons.phone,
                          title: "Contacts",
                          subtitle: "To connect your Buzz buddy",
                          value: contactsGranted,
                          color: AppColors.Tsetsecolor,
                          onTap: contactsPermission,
                          context: context,
                        ),
                        SizedBox(height: height * 0.04),
                        Reusablebutton(
                          text: 'Allow All & Continue',
                          backgroundColor: AppColors.Tsetsecolor,
                          onTap: () async {
                            await allowAllPermissions();

                            if (cameraGranted &&
                                notificationGranted &&
                                locationGranted &&
                                contactsGranted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlarmTimeScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Please allow all permissions to continue.",
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: height * 0.015),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AlarmTimeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip for now',
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: AppColors.Tsetsecolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
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
