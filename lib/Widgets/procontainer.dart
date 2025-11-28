import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';

class pro_container extends StatelessWidget {
  const pro_container({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.045, // responsive height
      width: screenWidth * 0.22, // responsive width
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.Tsetsecolor),
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            color: AppColors.Tsetsecolor.withOpacity(0.8),
            blurRadius: screenWidth * 0.12, // scaled blur radius
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.025),
            child: SvgIcon(
              'assets/icons/badge.svg',
              height: screenHeight * 0.018,
              width: screenHeight * 0.010,
            ),
          ),
          Text(
            'Pro',
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: AppColors.Tsetsecolor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
