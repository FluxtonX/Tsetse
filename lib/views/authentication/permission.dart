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
            Row(
              children: [
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
                GestureDetector(
                  onTap: () {
                    signOutUser();
                  },
                  child: Text('Log out'),
                ),
              ],
            ),

            SizedBox(height: 20),

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
            const SizedBox(height: 5),
            const Text(
              "TSETSE",
              style: TextStyle(
                color: AppColors.Tsetsecolor,
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
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
                        'Permission',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
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
                        value: cameraGranted,
                        color: AppColors.Tsetsecolor,
                        onTap: () {
                          requestcameraPermission();
                        },
                      ),
                      SizedBox(height: 10),

                      buildPermissionTile(
                        icon: Icons.notifications_none,
                        title: "Notification",
                        subtitle: "For pre alarm reminders",
                        value: notificationGranted,
                        color: AppColors.Tsetsecolor,
                        onTap: () {
                          notificationRequest();
                        },
                      ),
                      SizedBox(height: 10),

                      buildPermissionTile(
                        icon: Icons.location_on_outlined,
                        title: "Location",
                        subtitle: "To alert your Buzz buddy if you oversleep",
                        value: locationGranted,
                        color: AppColors.Tsetsecolor,
                        onTap: () {
                          locationPermission();
                        },
                      ),
                      SizedBox(height: 10),

                      buildPermissionTile(
                        icon: Icons.phone,
                        title: "Contacts",
                        subtitle: "To connect your Buzz buddy",
                        value: contactsGranted,
                        color: AppColors.Tsetsecolor,
                        onTap: () {
                          contactsPermission();
                        },
                      ),
                      SizedBox(height: 40),

                      Reusablebutton(
                        text: 'Allow All&continue',
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
                              SnackBar(
                                content: Text(
                                  "Please allow all permissions to continue.",
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlarmTimeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Skip for now',
                          style: TextStyle(
                            color: AppColors.Tsetsecolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
