import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Widget buildPermissionTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool value,
  required Color color,
  required VoidCallback onTap,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border(
        bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
      ),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
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
