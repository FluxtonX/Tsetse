import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/settings_provider.dart';
import 'package:tsetse/core/utils/app_colors.dart';

Widget buildSectionTitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(icon, color: AppColors.Tsetsecolor, size: 27),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget buildProfileCard(double width) {
  return Container(
    width: width * 0.9,
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
      border: Border(
        bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
      ),
    ),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
            const SizedBox(width: 10),

            // NAME + EMAIL
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hammed',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Example@gmail.com',
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
              ],
            ),

            const Spacer(),

            // EDIT BUTTON
            Text(
              "Edit",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.teal[700], // same as screenshot
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildBuzzBuddyCard(double width) {
  return Consumer<SettingsProvider>(
    builder: (BuildContext context, provider, Widget? child) {
      return Container(
        width: width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border(
            bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Emergency Contact",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F4F4F),
                      ),
                    ),
                    Text(
                      "Roommate(+1 344 5435 345)",
                      style: TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Change",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2F7F78), // screenshot greenish color
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Auto-Notify After 3 snooze",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F4F4F),
                      ),
                    ),
                    Text(
                      "Send Location & selfies",
                      style: TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Switch(
                  value: provider.autoNotify3,
                  onChanged: provider.toggleAutoNotify3,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF00C4CC), // teal
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildSwitchTile({
  required String title,
  required String subtitle,
  required bool value,
  required Function(bool) onChanged,
}) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2F4F4F),
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 8, color: Colors.grey),
          ),
        ],
      ),
      const Spacer(),
      Switch(
        value: value,
        onChanged: onChanged,

        activeColor: Colors.white,
        activeTrackColor: Color(0xFF00C4CC), // teal
      ),
    ],
  );
}

Widget buildSwitchSection(double width) {
  return Consumer<SettingsProvider>(
    builder: (BuildContext context, provider, Widget? child) {
      return Container(
        width: width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: const Border(
            bottom: BorderSide(
              color: Color(0xFF00C4CC), // teal line like screenshot
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile(
              title: "Pre-alarm Reminders",
              subtitle: "10minutes before alarm",
              value: provider.preAlarm,
              onChanged: provider.togglePreAlarm,
            ),

            const SizedBox(height: 20),

            _buildSwitchTile(
              title: "Auto-Notify After 3 snooze",
              subtitle: "Send Location & selfies",
              value: provider.autoNotify,
              onChanged: provider.toggleAutoNotify,
            ),

            const SizedBox(height: 20),

            _buildSwitchTile(
              title: "Auto-Notify After 3 snooze",
              subtitle: "Send Location & selfies",
              value: provider.autoNotify2,
              onChanged: provider.toggleAutoNotify2,
            ),
          ],
        ),
      );
    },
  );
}

Widget buildSoundtile(double width) {
  return Consumer<SettingsProvider>(
    builder: (BuildContext context, SettingsProvider provider, Widget? child) {
      return Container(
        width: width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: const Border(
            bottom: BorderSide(
              color: Color(0xFF00C4CC), // teal line like screenshot
              width: 2,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildSwitchTile(
              title: "Adaptive Volume",
              subtitle: "Increase after each snooze",
              value: provider.adaptiveVolume,
              onChanged: provider.toggleAdaptiveVolume,
            ),

            const SizedBox(height: 20),

            _buildSwitchTile(
              title: "Vibration Pattern",
              subtitle: "Random fly-like buzzes",
              value: provider.vibrationPattern,
              onChanged: provider.toggleVibration,
            ),
          ],
        ),
      );
    },
  );
}

Widget buildPermissionGroup({required double width}) {
  return Consumer<SettingsProvider>(
    builder: (context, settings, child) {
      return Container(
        width: width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: const Border(
            bottom: BorderSide(color: Color(0xFF00C4CC), width: 2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            buildSinglePermissionRow(
              "Camera Access",
              settings.cameraAccess1,
              settings.toggleCamera1,
            ),
            buildSinglePermissionRow(
              "Location Access",
              settings.cameraAccess2,
              settings.toggleCamera2,
            ),
            buildSinglePermissionRow(
              "Storage Access",
              settings.cameraAccess3,
              settings.toggleCamera3,
            ),
          ],
        ),
      );
    },
  );
}

Widget buildSinglePermissionRow(
  String title,
  bool value,
  void Function(bool value) toggleCamera1,
) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2F4F4F),
        ),
      ),
      const Spacer(),
      Switch(
        value: value,
        onChanged: toggleCamera1,
        activeColor: Colors.white,
        activeTrackColor: Color(0xFF00C4CC),
      ),
    ],
  );
}
