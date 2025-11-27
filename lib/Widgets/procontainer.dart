import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';

class pro_container extends StatelessWidget {
  const pro_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 82,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.Tsetsecolor),
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: AppColors.Tsetsecolor.withOpacity(0.8),
            blurRadius: 50,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgIcon('assets/icons/badge.svg', height: 14, width: 14),
          ),
          Text(
            'Pro',
            style: TextStyle(fontSize: 14, color: AppColors.Tsetsecolor),
          ),
        ],
      ),
    );
  }
}
