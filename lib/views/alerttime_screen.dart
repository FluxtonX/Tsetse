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
    return Scaffold(
      body: Container(
        width: double.infinity,
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
              const SizedBox(height: 30),

              // Top progress bar (step indicator)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // progress line
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.33, // 1/3 progress
                        backgroundColor: Colors.white,
                        color: AppColors.Tsetsecolor,
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text('1/3', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // Title
              Text(
                'Set your alarm time',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.Tsetsecolor,
                ),
              ),

              const SizedBox(height: 30),

              // Time picker
              SizedBox(
                height: 200,
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

              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
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
