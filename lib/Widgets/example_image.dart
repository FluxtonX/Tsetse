import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  final String imagePath;
  final String innerPath;
  final String label;
  final IconData icon;
  final Color iconColor;

  const ExampleImage({
    super.key,
    required this.imagePath,
    required this.innerPath,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: screenWidth * 0.40, // responsive width
              height: screenHeight * 0.32, // responsive height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.11,
              left: screenWidth * 0.17,
              child: Container(
                height: screenHeight * 0.065,
                width: screenWidth * 0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(innerPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black54,
          ),
        ),
        Icon(icon, color: iconColor, size: screenWidth * 0.07),
      ],
    );
  }
}
