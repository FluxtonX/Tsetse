import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class extrapreview extends StatelessWidget {
  const extrapreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(color: AppColors.lightskyblue),
      child: const Center(
        child: Text(
          'Exita Preview',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class Startmission extends StatelessWidget {
  const Startmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 236,
      decoration: BoxDecoration(
        color: AppColors.Tsetsecolor,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: AppColors.Tsetsecolor.withOpacity(0.8),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Start Mission',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class snoozebutton extends StatelessWidget {
  String text;
  snoozebutton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 178,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.snooze, size: 23, color: Colors.black),
          // SvgIcon('assets/icons/snoozeicons.svg', color: Colors.red),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
