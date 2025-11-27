import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/alarm_widgets.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';
import 'package:tsetse/views/lasr_snooze.dart';

class Snooze1Screen extends StatelessWidget {
  const Snooze1Screen({super.key});

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

            const SizedBox(height: 25),

            // SvgIcon('assets/icons/mainicon.svg'),
            Image.asset('assets/images/icons1.png', height: 188, width: 188),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '05:49',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF00BCD4),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Message text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'WAKE UP, DANIEL. YOU’RE NOT DYING OF SLEEPING SICKNESS TODAY.',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LastSnooze()),
                );
              },
              child: snoozebutton(text: 'snooze 2'),
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
