import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/mugshot.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class MugshotGalleryScreen extends StatelessWidget {
  const MugshotGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.05), // responsive spacing
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                          vertical: height * 0.02,
                        ),
                        child: buildHeader(width, height),
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.14),
                            topRight: Radius.circular(width * 0.14),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ), // responsive spacing
                            buildStatsCard(width, height),
                            SizedBox(height: height * 0.03),
                            buildMugshotGrid(width, height),
                            SizedBox(
                              height: height * 0.12,
                            ), // spacing at bottom
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mugshot Gallery',
          style: TextStyle(
            fontSize: width * 0.06, // responsive font size
            fontWeight: FontWeight.bold,
            color: AppColors.Tsetsecolor,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: height * 0.005),
        Text(
          'Your Wake-Up History',
          style: TextStyle(
            fontSize: width * 0.045,
            color: AppColors.subtittlecolor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildStatsCard(double width, double height) {
    return Container(
      height: height * 0.07, // responsive height
      width: width * 0.9, // responsive width
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
      child: Row(
        children: [
          SizedBox(width: width * 0.03),
          Image.asset(
            'assets/images/mugicon.png',
            height: height * 0.035,
            color: AppColors.Tsetsecolor,
          ),
          SizedBox(width: width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              Text(
                '89%',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF00838F),
                ),
              ),
              Text(
                'Success Rate',
                style: TextStyle(
                  fontSize: width * 0.03,
                  color: const Color(0xFF78909C),
                  height: 0.8,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  right: width * 0.05,
                ),
                child: Row(
                  children: [
                    Text(
                      'Days Streaks',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: const Color(0xFF78909C),
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00838F),
                      ),
                    ),
                    Text('🔥', style: TextStyle(fontSize: width * 0.05)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget buildMugshotGrid(double width, double height) {
  //   return MugshotGrid(width: width, height: height); // delegate to your Mugshot widget
  // }
}
