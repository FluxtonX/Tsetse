import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  const ReusableTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery values
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.005),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.005),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(width * 0.05),
            bottomLeft: Radius.circular(width * 0.05),
          ),
          border: Border(
            bottom: BorderSide(
              color: AppColors.Tsetsecolor,
              width: width * 0.004,
            ),
          ),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(fontSize: width * 0.04),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color.fromRGBO(154, 154, 154, 1),
              fontSize: width * 0.04,
            ),
            prefixIcon: Icon(icon, color: Colors.black, size: width * 0.06),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.018,
            ),
          ),
        ),
      ),
    );
  }
}
