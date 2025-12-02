import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/alarm_widgets.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/noremaining_snooze.dart';

class LastSnooze extends StatelessWidget {
  const LastSnooze({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.2),

              // Image
              Image.asset(
                'assets/images/icons1.png',
                height: height * 0.25,
                width: height * 0.25,
              ),

              SizedBox(height: height * 0.03),

              // Time
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '05:00',
                      style: TextStyle(
                        fontSize: width * 0.10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF00BCD4),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.06),

              // Message text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Text(
                  'Your Buzz Buddy has been alerted. They now know you’re still in bed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: AppColors.subtittlecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: height * 0.05),

              // Start mission button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoremainingSnooze(),
                    ),
                  );
                },
                child: SizedBox(
                  width: width * 0.6,
                  height: height * 0.06,
                  child: Startmission(),
                ),
              ),

              SizedBox(height: height * 0.015),

              // Small text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Text(
                  'The alarm won\'t stop until you start your mission',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: AppColors.subtittlecolor,
                  ),
                ),
              ),

              SizedBox(height: height * 0.08),

              // Extra Preview button
              SizedBox(
                width: width,
                height: height * 0.06,
                child: extrapreview(),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
