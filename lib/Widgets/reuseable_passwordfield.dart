import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class ReuseablePasswordfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
   final TextEditingController controller;
  const ReuseablePasswordfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),

          border: Border(
            bottom: BorderSide(color: AppColors.Tsetsecolor, width: 1.5),
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromRGBO(154, 154, 154, 1)),

            prefixIcon: Icon(prefixIcon, color: Colors.black),
            suffixIcon: Icon(suffixIcon, color: Colors.black),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
