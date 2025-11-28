import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';
import 'package:tsetse/views/Pro_tsetse.dart';
import 'package:tsetse/views/addalaram_screen.dart';
import 'package:tsetse/views/pro_screen.dart';
import 'package:tsetse/views/snooze1_screen.dart';
import 'package:tsetse/views/test_alarm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.03),
        child: Container(
          width: width * 0.17,
          height: width * 0.17,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors.Tsetsecolor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAlarmScreen()),
              );
            },
            child: Icon(Icons.add, size: width * 0.08, color: Colors.white),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: height * 0.03),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
          height: height * 0.08,
          decoration: BoxDecoration(
            color: AppColors.Tsetsecolor,
            borderRadius: BorderRadius.circular(width * 0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomIcon(icon: Icons.alarm, label: "Alarm", width: width),
              BottomIcon(icon: Icons.photo, label: "Gallery", width: width),
              BottomIcon(icon: Icons.group, label: "Buzz Buddy", width: width),
              BottomIcon(icon: Icons.settings, label: "Setting", width: width),
            ],
          ),
        ),
      ),

      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.05,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05),
                  Row(
                    children: [
                      Text(
                        "TSETSE",
                        style: TextStyle(
                          fontSize: width * 0.08,
                          color: const Color(0xFF00A8A8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: width * 0.40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestAlarmScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.035,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.01),
                            border: Border.all(color: AppColors.subtittlecolor),
                          ),
                          child: Center(
                            child: Text(
                              "Test Alarm",
                              style: TextStyle(
                                fontSize: width * 0.025,
                                color: AppColors.Tsetsecolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "The Alarm That Won’t Let You Sleep",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.045),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.01,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00A8A8),
                                    blurRadius: width * 0.03,
                                    offset: Offset(0, height * 0.01),
                                  ),
                                ],
                                color: const Color(0xFFE0F7FA),
                                borderRadius: BorderRadius.circular(
                                  width * 0.05,
                                ),
                                border: Border.all(
                                  color: AppColors.Tsetsecolor,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgIcon(
                                    'assets/icons/badge.svg',
                                    height: width * 0.05,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    "Pro Feature",
                                    style: TextStyle(
                                      color: const Color(0xFF00A8A8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "15",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05,
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                            size: width * 0.06,
                          ),
                        ],
                      ),
                    ),
                    AlarmCard(width: width, height: height),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmCard extends StatelessWidget {
  final double width;
  final double height;

  const AlarmCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.045),
      padding: EdgeInsets.all(width * 0.045),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.07),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: width * 0.03,
            offset: Offset(0, height * 0.01),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(width * 0.015),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                child: Text("80%", style: TextStyle(fontSize: width * 0.035)),
              ),
              SizedBox(width: width * 0.015),
              Expanded(
                child: Text(
                  "TSETSE predicts a strong wake-up performance today!",
                  style: TextStyle(fontSize: width * 0.035),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.018),
          Text(
            "S  M  T  W  T  S",
            style: TextStyle(
              fontSize: width * 0.035,
              letterSpacing: 1.5,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.012),
          Row(
            children: [
              Text(
                "06 : 30 AM",
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Switch(value: true, onChanged: (_) {}),
              SizedBox(width: width * 0.02),
              Icon(Icons.more_vert, size: width * 0.06),
            ],
          ),
          Container(
            height: height * 0.03,
            width: width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.01),
              border: Border.all(color: AppColors.Tsetsecolor),
            ),
            child: Center(
              child: Text(
                "Buzz Mode",
                style: TextStyle(
                  fontSize: width * 0.025,
                  color: AppColors.subtittlecolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final double width;

  const BottomIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: width * 0.05),
        SizedBox(height: width * 0.01),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: width * 0.03),
        ),
      ],
    );
  }
}
