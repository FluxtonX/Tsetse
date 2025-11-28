import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/procontainer.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/Pro_tsetse.dart';

class ProNext extends StatelessWidget {
  const ProNext({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.08),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pro_container(),
                    Icon(
                      Icons.close,
                      size: width * 0.08,
                      color: AppColors.Tsetsecolor,
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Text(
                  'Save 15 minutes with powerful Pro Features',
                  style: TextStyle(
                    fontSize: width * 0.075,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_outlined,
                      color: AppColors.Tsetsecolor,
                      size: width * 0.06,
                    ),
                    SizedBox(width: width * 0.015),
                    Text(
                      '10M+ wake up data analyzed',
                      style: TextStyle(
                        color: AppColors.subtittlecolor,
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),

              Image.asset(
                'assets/images/Frame.png',
                width: width * 0.8,
                height: height * 0.4,
                fit: BoxFit.contain,
              ),

              SizedBox(height: height * 0.06),

              SizedBox(
                width: width * 0.65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C4CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.08),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProTsetse()),
                    );
                  },
                  child: Text(
                    "Start my free week",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.01),

              Text(
                'Not charge until trial ends',
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subtittlecolor,
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
