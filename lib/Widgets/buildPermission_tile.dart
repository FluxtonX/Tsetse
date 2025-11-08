import 'package:flutter/material.dart';

Widget buildPermissionTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool value,
  required Color color,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
    decoration: BoxDecoration(
      border: Border.all(color: color, width: 1.2),
      borderRadius: BorderRadius.circular(15),
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
        Switch(value: value, onChanged: (_) {}, activeColor: color),
      ],
    ),
  );
}