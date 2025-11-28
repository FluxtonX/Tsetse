import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Widget buildPermissionTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool value,
  required Color color,
  required VoidCallback onTap,
  required BuildContext context, // pass context for MediaQuery
}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
    margin: EdgeInsets.symmetric(
      vertical: height * 0.001,
      horizontal: width * 0.05,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: width * 0.01,
      vertical: height * 0.002,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(width * 0.04),
      border: Border(
        bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
      ),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: width * 0.055,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color, size: width * 0.06),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.04,
                ),
              ),
              SizedBox(height: height * 0.004),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: width * 0.023,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: (val) {
            if (val == true) {
              onTap();
            } else {
              openAppSettings();
            }
          },
          activeColor: color,
        ),
      ],
    ),
  );
}
