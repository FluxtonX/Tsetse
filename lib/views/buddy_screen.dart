import 'package:flutter/material.dart';
import 'package:tsetse/views/Home_screen.dart';

class BuddyScreen extends StatefulWidget {
  const BuddyScreen({super.key});

  @override
  State<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends State<BuddyScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F6F5), Color(0xFFB3E5FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.07,
                  vertical: height * 0.03,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.02),
                          child: LinearProgressIndicator(
                            value: 1,
                            backgroundColor: Colors.white,
                            color: const Color(0xFF00A8A8),
                            minHeight: height * 0.008,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.015),
                    Text(
                      "3/3",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.08),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Text(
                  "Choose your Buzz Buddy",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF007C7C),
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),

              Expanded(
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.14),
                      topRight: Radius.circular(width * 0.14),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.03,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Buzz Buddy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF004D4D),
                            height: 1.4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 0.025),
                          child: Text(
                            'Let the user add or invite a friend, roommate, or classmate who will get a “wake-up alert” if the user fails to wake up after 3 snoozes.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.037,
                              height: 1.4,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.03),
                        BuzzBuddyCard(onTap: () {}),
                        SizedBox(height: height * 0.08),

                        SizedBox(
                          width: width * 0.55,
                          height: height * 0.065,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C4CC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  width * 0.08,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Invite Friend",
                              style: TextStyle(
                                fontSize: width * 0.045,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip for now',
                            style: TextStyle(fontSize: width * 0.04),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuzzBuddyCard extends StatelessWidget {
  final VoidCallback onTap;

  const BuzzBuddyCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: width * 0.025,
              offset: Offset(0, height * 0.005),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.11,
              height: width * 0.11,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA),
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: const Icon(
                Icons.person_add_alt_1,
                color: Color(0xFF00A8A8),
                size: 26,
              ),
            ),
            SizedBox(width: width * 0.035),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buzz Buddy",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  "If you fail to wake-up, your chosen friend gets notified",
                  style: TextStyle(
                    fontSize: width * 0.022,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
