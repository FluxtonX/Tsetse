import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/alarm_widgets.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';
import 'package:tsetse/views/snooze1_screen.dart';

class TestAlarmScreen extends StatelessWidget {
  const TestAlarmScreen({super.key});

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
            const SizedBox(height: 60),

            const Text(
              'October 31 Fri',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.Tsetsecolor,
                fontWeight: FontWeight.w500,
              ),
            ),

            // Time
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '06:30',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF00BCD4),
                      letterSpacing: 2,
                    ),
                  ),
                  TextSpan(
                    text: 'AM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // SvgIcon('assets/icons/mainicon.svg'),
            Image.asset('assets/images/icons1.png', height: 188, width: 188),

            const SizedBox(height: 30),

            // Message text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Still sleeping? Your future self will\nthank you for getting up now ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.subtittlecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Snooze button
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Snooze1Screen()),
                );
              },
              child: snoozebutton(text: 'snooze 3'),
            ),
            SizedBox(height: 20),

            GestureDetector(onTap: () {}, child: Startmission()),

            const SizedBox(height: 15),

            // Small text
            const Text(
              'The alarm won\'t stop until you start your mission',
              style: TextStyle(fontSize: 14, color: AppColors.subtittlecolor),
            ),

            const SizedBox(height: 70),

            // Extra Preview button
            extrapreview(),
          ],
        ),
      ),
    );
  }
}
