// Example image preview
import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  final String imagePath;
  final String innerPath;
  final String label;
  final IconData icon;
  final Color iconColor;

  const ExampleImage({super.key, 
    required this.imagePath,
    required this.innerPath,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 172,
              height: 237,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            Positioned(
              top: 82,
              left: 65,
              child: Container(
                height: 50,
                width: 45,
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

        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Icon(icon, color: iconColor),
      ],
    );
  }
}
