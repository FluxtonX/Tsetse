import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/addalaram_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: AppColors.Tsetsecolor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAlarmScreen()),
              );
            },
            child: const Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.Tsetsecolor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              BottomIcon(icon: Icons.alarm, label: "Alarm"),
              BottomIcon(icon: Icons.photo, label: "Gallery"),
              BottomIcon(icon: Icons.group, label: "Buzz Buddy"),
              BottomIcon(icon: Icons.settings, label: "Setting"),
            ],
          ),
        ),
      ),

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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Text(
                        "TSETSE",
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xFF00A8A8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160),
                        child: Container(
                          height: 27,
                          width: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.subtittlecolor),
                          ),
                          child: Center(
                            child: const Text(
                              "Test Alarm",
                              style: TextStyle(
                                fontSize: 08,
                                color: AppColors.Tsetsecolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),
                  const Text(
                    "The Alarm That Won’t Let You Sleep",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),

            Expanded(
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF00A8A8),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              color: const Color(0xFFE0F7FA),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.Tsetsecolor),
                            ),
                            child: const Text(
                              "Pro Feature",
                              style: TextStyle(
                                color: Color(0xFF00A8A8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "15",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.monetization_on,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    AlarmCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: const Color(0xFF00C4CC), width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("80%"),
              ),
              const SizedBox(width: 6),
              const Expanded(
                child: Text(
                  "TSETSE predicts a strong wake-up performance today!",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Text(
            "S  M  T  W  T  S",
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.5,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Text(
                "06 : 30 AM",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Switch(value: true, onChanged: (_) {}),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert),
            ],
          ),
          Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.Tsetsecolor),
            ),
            child: Center(
              child: const Text(
                "Buzz Mode",
                style: TextStyle(
                  fontSize: 08,
                  color: AppColors.subtittlecolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 8)),
      ],
    );
  }
}
