import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tsetse/views/buddy_screen.dart';

class FaceVerifactionscreen extends StatefulWidget {
  const FaceVerifactionscreen({super.key});

  @override
  State<FaceVerifactionscreen> createState() => _FaceVerifactionscreenState();
}

class _FaceVerifactionscreenState extends State<FaceVerifactionscreen> {
  Future<void> captureimage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuddyScreen()),
        );
      });
    }
  }

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
          top: true,
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 26,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    ),
                    const SizedBox(width: 5),
                    const Text("2/3", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Choose wake up mission",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF007C7C),
                  ),
                ),
              ),

              const SizedBox(height: 60),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                            "Camera",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          'Correct Method for selfies',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF004D4D),
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 1.2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/face1.png",
                                      ), // your clear image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "open Eyes",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 26,
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 1.2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/face1.png",
                                      ), // your unclear image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  " close Eyes",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 26,
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: 220,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF00C4CC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              captureimage();
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
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
