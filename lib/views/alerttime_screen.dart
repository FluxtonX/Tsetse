import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart'
    show Reusablebutton;
import 'package:tsetse/views/wakeup_activation.dart';

class AlarmTimeScreen extends StatefulWidget {
  const AlarmTimeScreen({super.key});

  @override
  State<AlarmTimeScreen> createState() => _AlarmTimeScreenState();
}

class _AlarmTimeScreenState extends State<AlarmTimeScreen> {
  DateTime selectedTime = DateTime.now();

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
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: height * 0.04),

              // Top progress bar (step indicator)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // progress line
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.33, // 1/3 progress
                        backgroundColor: Colors.white,
                        color: AppColors.Tsetsecolor,
                        minHeight: height * 0.008,
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Text(
                      '1/3',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.1),

              // Title
              Text(
                'Set your alarm time',
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.Tsetsecolor,
                ),
              ),

              SizedBox(height: height * 0.15),

              // Time picker
              SizedBox(
                height: height * 0.13,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.light),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: selectedTime,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        selectedTime = newTime;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: height * 0.30),

              // Next button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Reusablebutton(
                  text: "Next",
                  backgroundColor: AppColors.Tsetsecolor,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WakeupActivation(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
