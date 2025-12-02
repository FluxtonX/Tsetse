import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/auth_provider.dart';
import 'package:tsetse/Widgets/settings.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.08),

              // ---------- TITLE ----------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.bold,
                    color: AppColors.Tsetsecolor,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Text(
                  "Control how TSETSE bugs you — and who gets to laugh.",
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: AppColors.subtittlecolor,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              //  WHITE CARD
              Consumer<AuthProviders>(
                builder: (BuildContext context, provider, Widget? child) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.14),
                        topRight: Radius.circular(width * 0.14),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      child: Column(
                        children: [
                          // PROFILE
                          buildSectionTitle('Profile', Icons.person),
                          SizedBox(height: height * 0.005),
                          buildProfileCard(width),
                          SizedBox(height: height * 0.03),

                          // ---------------- BUZZ BUDDY ----------------
                          buildSectionTitle(
                            "Buzz Buddy",
                            Icons.groups_2_outlined,
                          ),
                          buildBuzzBuddyCard(width),
                          SizedBox(height: height * 0.02),

                          // NOTIFICATIONS
                          buildSectionTitle(
                            "Notification",
                            Icons.notifications_outlined,
                          ),
                          buildSwitchSection(width),
                          SizedBox(height: height * 0.02),

                          //  SOUND
                          buildSectionTitle(
                            "Sound & Vibration",
                            Icons.volume_up_outlined,
                          ),
                          buildSoundtile(width),
                          SizedBox(height: height * 0.02),

                          //  PERMISSIONS
                          buildSectionTitle(
                            "Permissions",
                            Icons.verified_user_outlined,
                          ),
                          buildPermissionGroup(width: width),
                          SizedBox(height: height * 0.03),

                          //  HELP
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.04,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.04),
                              border: const Border(
                                bottom: BorderSide(
                                  color: Color(0xFF00C4CC),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  color: AppColors.Tsetsecolor,
                                  size: width * 0.05,
                                ),
                                SizedBox(width: width * 0.03),
                                Text(
                                  "Help & Support",
                                  style: TextStyle(fontSize: width * 0.04),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: width * 0.03,
                                  color: AppColors.Tsetsecolor,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: height * 0.04),

                          //  LOGOUT
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                await provider.logout();
                                if (context.mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
                                  horizontal: width * 0.15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    width * 0.05,
                                  ),
                                  border: const Border(
                                    bottom: BorderSide(
                                      color: Color(0xFF00C4CC),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: AppColors.subtittlecolor,
                                      size: width * 0.05,
                                    ),
                                    SizedBox(width: width * 0.03),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: AppColors.subtittlecolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.05),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
