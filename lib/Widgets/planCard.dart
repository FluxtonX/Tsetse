import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

Widget buildPlanCard({
  required bool isSelected,
  required String title,
  required String subtitle,
  required String priceMonthly,
  required String? oldPrice,
  required String newPrice,
  String? badgeText,
  required VoidCallback onTap,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      return GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// MAIN CARD
            Container(
              height: screenHeight * 0.08,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.07),
                border: Border.all(
                  color: isSelected ? Color(0xFF00C4CC) : Colors.grey.shade300,
                  width: isSelected ? 2.2 : 1,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? Color(0xFF00C4CC)
                            : Color.fromRGBO(190, 190, 190, 1),
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            color: Color(0xFF00C4CC),
                            size: screenWidth * 0.045,
                          )
                        : null,
                  ),

                  SizedBox(width: screenWidth * 0.035),

                  /// TEXT
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.Tsetsecolor
                              : Colors.black54,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  /// PRICE TEXT
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        priceMonthly,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w700,
                          color: AppColors.subtittlecolor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.002),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (oldPrice != null)
                            Text(
                              oldPrice,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Color.fromRGBO(61, 90, 94, 1),
                                fontSize: screenWidth * 0.025,
                              ),
                            ),
                          if (oldPrice != null)
                            SizedBox(width: screenWidth * 0.015),
                          Text(
                            newPrice,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            if (badgeText != null)
              Positioned(
                right: screenWidth * 0.04,
                top: -screenHeight * 0.015,
                child: Container(
                  height: screenHeight * 0.025,
                  width: screenWidth * 0.15,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.025,
                    vertical: screenHeight * 0.004,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.Tsetsecolor,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  child: Text(
                    badgeText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
