import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/authentication/auth_screen.dart';

class WakeupActivation extends StatelessWidget {
  const WakeupActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightskyblue, AppColors.skyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Top progress bar (step indicator)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // progress line
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.white,
                        color: AppColors.Tsetsecolor,
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text('2/3', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // Title
              Text(
                'Choose wake up \nmission',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.Tsetsecolor,
                ),
              ),

              const SizedBox(height: 30),
              MissionCard(
                icon: Icons.camera_alt_outlined,
                title: "Photo",
                subtitle: "Take a photo of a part of your morning routine",
                onTap: () {
                  // TODO: Handle photo mission selection
                },
              ),

              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
                child: Reusablebutton(
                  text: "Next",
                  backgroundColor: AppColors.Tsetsecolor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MissionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF00A8A8), size: 28),
            ),
            const SizedBox(width: 16),

            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
