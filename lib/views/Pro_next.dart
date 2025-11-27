import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/procontainer.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/Pro_tsetse.dart';

class ProNext extends StatelessWidget {
  const ProNext({super.key});

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
                'Save 15 minutes with powerful Pro Features',
                style: TextStyle(
                  fontSize: 34,
                  color: AppColors.Tsetsecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 26),
                Icon(
                  Icons.check_outlined,
                  color: AppColors.Tsetsecolor,
                  size: 25,
                ),
                SizedBox(width: 4),

                Text(
                  '10M+ wake up data analyzed',
                  style: TextStyle(
                    color: AppColors.subtittlecolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/Frame.png'),
            SizedBox(height: 30),

            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C4CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProTsetse()),
                  );
                },
                child: const Text(
                  "Start my free week",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Not charge until trial ends',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.subtittlecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
