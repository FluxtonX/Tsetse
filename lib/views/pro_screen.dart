import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';
import 'package:tsetse/gen/assets.gen.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({super.key});

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 38,
                    width: 82,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.Tsetsecolor),
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  SvgIcon('assets/icons/badge.svg', height: 50, width: 50),
                  // Assets.icons.badge1.svg(height: 112, width: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
