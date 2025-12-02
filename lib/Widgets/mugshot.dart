import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

Widget buildMugshotCard(MugshotData data, double width, double height) {
  double cardSize = width * 0.35; // responsive square card
  double imageSize = cardSize; // image is same as card width
  double statusIconSize = width * 0.04; // responsive icon
  double textFontSize = width * 0.035; // responsive text
  double dateFontSize = width * 0.03;

  return Column(
    children: [
      // 🔹 Image with rounded square shape
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(width * 0.05),
            child: Container(
              height: imageSize,
              width: imageSize,
              color: const Color(0xFFD0D8DC),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) {
                  return Icon(
                    Icons.person,
                    size: width * 0.15,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),

          // 🔹 Status Icon (check or cross)
          Positioned(
            top: height * 0.01,
            right: width * 0.01,
            child: Container(
              padding: EdgeInsets.all(width * 0.015),
              decoration: BoxDecoration(
                color: data.isSuccess ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                data.isSuccess ? Icons.check : Icons.close,
                size: statusIconSize,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      // 🔹 White container below image
      Container(
        width: cardSize,
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * 0.05),
            bottomRight: Radius.circular(width * 0.05),
          ),
          border: Border(
            bottom: BorderSide(color: AppColors.Tsetsecolor, width: 2),
          ),
        ),
        child: Column(
          children: [
            Text(
              data.date,
              style: TextStyle(
                fontSize: dateFontSize,
                color: const Color(0xFF00838F),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data.time,
              style: TextStyle(
                fontSize: dateFontSize,
                color: const Color(0xFF00838F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildMugshotGrid(double width, double height) {
  final List<MugshotData> mugshots = [
    MugshotData(
      date: 'Oct 28',
      time: '6:30am',
      isSuccess: true,
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    ),
    MugshotData(
      date: 'Oct 27',
      time: '6:30am',
      isSuccess: true,
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    ),
    MugshotData(
      date: 'Oct 26',
      time: '6:30am',
      isSuccess: true,
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    ),
    MugshotData(
      date: 'Oct 25',
      time: '6:30am',
      isSuccess: false,
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
    ),
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: height * 0.0,
      childAspectRatio: 0.85, // keeps image+text layout proportional
    ),
    itemCount: mugshots.length,
    itemBuilder: (context, index) {
      return buildMugshotCard(mugshots[index], width, height);
    },
  );
}

class MugshotData {
  final String date;
  final String time;
  final bool isSuccess;
  final String imageUrl;

  MugshotData({
    required this.date,
    required this.time,
    required this.isSuccess,
    required this.imageUrl,
  });
}

Widget buildHeader(double width, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Mugshot Gallery',
        style: TextStyle(
          fontSize: width * 0.06,
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
    height: height * 0.07,
    width: width * 0.9,
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
              padding: EdgeInsets.only(top: height * 0.02, right: width * 0.05),
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
