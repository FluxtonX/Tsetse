import 'package:flutter/material.dart';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),

      // Custom Appbar
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Alarm",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF007C7C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Gradient Top Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55),
                ),
              ),
              child: Column(
                children: [
                  // Alarm Label card
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
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
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
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

                  const SizedBox(height: 30),

                  // Time Selector Wheel Cards
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "05 : 29",
                          style: TextStyle(fontSize: 26, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "06 : 30 AM",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "07 : 31 PM",
                          style: TextStyle(fontSize: 26, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

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
                      const Text("Everyday", style: TextStyle(fontSize: 15)),
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
            _settingTile(Icons.music_note, "Sounds", "Angry Swarm Tsetse"),
            _settingTile(Icons.snooze, "Snooze", "5 minutes"),
            _settingTile(
              Icons.notifications_active,
              "Buzz Mode",
              "10mins before pre-alarm notification",
            ),
            _settingTile(
              Icons.group,
              "Buzz Buddy",
              "After 3 snooze your friend gets notified",
            ),
            _settingTile(
              Icons.visibility,
              "Spy Mode",
              "Predicts your wake-up performance",
            ),

            const SizedBox(height: 20),

            // Save button
            Container(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C4CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
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
    );
  }

  // Reusable setting tile
  Widget _settingTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
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
