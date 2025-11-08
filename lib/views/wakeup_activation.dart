import 'package:flutter/material.dart';

class WakeupActivation extends StatelessWidget {
  const WakeupActivation({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 0.66,
                          backgroundColor: Colors.white,
                          color: Color(0xFF00A8A8),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    const Text("2/3", style: TextStyle(color: Colors.black54)),
                  ],
                ),

                const SizedBox(height: 60),

                const Text(
                  "Choose wake up mission",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF007C7C),
                  ),
                ),

                const SizedBox(height: 50),

                // Face Verification Card
                _MissionCard(
                  icon: Icons.face,
                  title: "Face Verification",
                  subtitle: "To stop the ringing show your face with open eyes",
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                // Photo Card (opens bottom sheet)
                _MissionCard(
                  icon: Icons.camera_alt_outlined,
                  title: "Photo",
                  subtitle: "Take a photo of a part of your morning routine",
                  onTap: () => _showPhotoBottomSheet(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Show Bottom Sheet
  void _showPhotoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),

              // Photo label
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Photo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Instruction text
              const Text(
                'Show me your morning proof! instead of “Take a selfie to confirm.”',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF004D4D),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 30),

              // Image examples
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ExampleImage(
                    imagePath:
                        'https://img.icons8.com/?size=100&id=85779&format=png', // placeholder
                    label: 'Clear visible',
                    icon: Icons.check,
                    iconColor: Colors.green,
                  ),
                  _ExampleImage(
                    imagePath:
                        'https://img.icons8.com/?size=100&id=100511&format=png', // placeholder
                    label: 'Not clear',
                    icon: Icons.close,
                    iconColor: Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Bottom button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A8A8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 14,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Photo",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

// Reusable mission card widget
class _MissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MissionCard({
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

// Example image widget
class _ExampleImage extends StatelessWidget {
  final String imagePath;
  final String label;
  final IconData icon;
  final Color iconColor;

  const _ExampleImage({
    required this.imagePath,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 1.2),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Icon(icon, color: iconColor),
      ],
    );
  }
}
