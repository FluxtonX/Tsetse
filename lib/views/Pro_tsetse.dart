import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/procontainer.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class ProTsetse extends StatelessWidget {
  const ProTsetse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pro_container(),
                  // Assets.icons.badge1.svg(height: 112, width: 32),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: AppColors.Tsetsecolor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(
                'Start your 7-day free trial for Pro',
                style: TextStyle(
                  fontSize: 34,
                  color: AppColors.Tsetsecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
