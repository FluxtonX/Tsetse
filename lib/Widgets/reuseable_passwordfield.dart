import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/auth_provider.dart';
import 'package:tsetse/Providers/confirmvisibility_provider.dart';
import 'package:tsetse/Providers/passwordvissibility_provider.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class ReuseablePasswordfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ReuseablePasswordfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery dimensions
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final passwordProvider = Provider.of<PasswordVisibilityProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
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
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: passwordProvider.isObscure,
          style: TextStyle(fontSize: width * 0.04),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color.fromRGBO(154, 154, 154, 1),
              fontSize: width * 0.04,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black,
              size: width * 0.06,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                passwordProvider.toggleVisibility();
              },
              icon: Icon(
                passwordProvider.isObscure
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,
              ),
            ),
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
