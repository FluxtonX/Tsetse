import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/Home_screen.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  String alarmLabel = "Morning class, gym, etc..";
  final TextEditingController _controller = TextEditingController();
  DateTime selectedTime = DateTime.now();
  void _editLabel() {
    _controller.text = alarmLabel;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Alarm Label"),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter label"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                alarmLabel = _controller.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  bool snooze = false;
  bool buzz = false;
  bool buddy = false;
  bool spy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 20),
                const Icon(
                  Icons.arrow_back_sharp,
                  color: AppColors.subtittlecolor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Add Alarm',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Tsetsecolor,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Gradient Top Section
            InkWell(
              onTap: _editLabel,
              child: Container(
                height: 93,
                width: 345,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Alarm Lable",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.amber),
                            SizedBox(width: 6),
                            Text(
                              "Morning class, gym, etc..",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.edit, size: 18),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      // Time picker
                      SizedBox(
                        height: 150,
                        child: CupertinoTheme(
                          data: const CupertinoThemeData(
                            brightness: Brightness.light,
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: selectedTime,
                            use24hFormat: false,
                            onDateTimeChanged: (DateTime newTime) {
                              setState(() {
                                selectedTime = newTime;
                              });
                            },
                          ),
                        ),
                      ),
                      // Repeat Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Repeat",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: true,
                                  onChanged: (v) {},
                                  activeColor: Color(0xFF00C4CC),
                                ),
                                const Text(
                                  "Everyday",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Weekday Selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _day("S"),
                          _day("M"),
                          _day("T"),
                          _day("W"),
                          _day("T"),
                          _day("F"),
                          _day("S"),
                        ],
                      ),
                      const SizedBox(height: 20),

                      _settingTile(
                        Icons.camera_alt,
                        "Stop with Photo",
                        "Clear background using same object",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),

                      _settingTile(
                        Icons.music_note,
                        "Sounds",
                        "Angry Swarm Tsetse",
                        trailingIcon: Icons.chevron_right,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),
                      _settingTile(
                        Icons.snooze,
                        "Snooze",
                        "5 minutes",
                        showSwitch: true,
                        switchValue: snooze,
                        onToggle: (value) {
                          setState(() {
                            snooze = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),
                      _settingTile(
                        Icons.notifications_active,
                        "Buzz Mode",
                        "10mins before pre-alarm notification",
                        showSwitch: true,
                        switchValue: buzz,
                        onToggle: (value) {
                          setState(() {
                            buzz = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),
                      _settingTile(
                        Icons.group,
                        "Buzz Buddy",
                        "After 3 snooze your friend gets notified",
                        showSwitch: true,
                        switchValue: buddy,
                        onToggle: (value) {
                          setState(() {
                            buddy = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),
                      _settingTile(
                        Icons.visibility,
                        "Spy Mode",
                        "Predicts your wake-up performance",
                        showSwitch: true,
                        switchValue: spy,
                        onToggle: (value) {
                          setState(() {
                            spy = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.Tsetsecolor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Save button
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00C4CC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Save Alarm",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable setting tile
  Widget _settingTile(
    IconData icon,
    String title,
    String subtitle, {
    IconData? trailingIcon, // OPTIONAL
    bool showSwitch = false,
    bool switchValue = false,
    ValueChanged<bool>? onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF00C4CC), size: 26),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          if (showSwitch) Switch(value: switchValue, onChanged: onToggle),

          // 🟩 TRAILING ICON (only if switch is NOT shown AND icon provided)
          if (!showSwitch && trailingIcon != null) Icon(trailingIcon),
        ],
      ),
    );
  }

  // Reusable day circle
  Widget _day(String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}
