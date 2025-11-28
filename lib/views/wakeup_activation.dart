import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tsetse/Widgets/example_image.dart';
import 'package:tsetse/Widgets/missoncard.dart';
import 'package:tsetse/views/face_verifactionscreen.dart';

class WakeupActivation extends StatefulWidget {
  const WakeupActivation({super.key});

  @override
  State<WakeupActivation> createState() => _WakeupActivationState();
}

class _WakeupActivationState extends State<WakeupActivation> {
  File? _capturedImage;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _capturedImage = File(image.path);
      });
      // Reopen the bottom sheet AFTER capturing the photo
      Future.delayed(const Duration(milliseconds: 300), () {
        showCapturedImageSheet(context);
      });
    } else {
      print('No image selected');
    }
  }

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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        child: LinearProgressIndicator(
                          value: 0.66,
                          backgroundColor: Colors.white,
                          color: const Color(0xFF00A8A8),
                          minHeight: height * 0.008,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Text(
                      "2/3",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.08),

                Text(
                  "Choose wake up mission",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF007C7C),
                  ),
                ),

                SizedBox(height: height * 0.06),

                MissionCard(
                  icon: Icons.face,
                  title: "Face Verification",
                  subtitle: "To stop the ringing show your face with open eyes",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FaceVerifactionscreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: height * 0.02),

                MissionCard(
                  icon: Icons.camera_alt_outlined,
                  title: "Photo",
                  subtitle: "Take a photo of a part of your morning routine",
                  onTap: () => showPhotoBottomSheet(context, width, height),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPhotoBottomSheet(BuildContext context, double width, double height) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.025,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width * 0.15,
                height: height * 0.007,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
              ),
              SizedBox(height: height * 0.02),

              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 300));
                  pickImage();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                  child: Text(
                    "Photo",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              Text(
                'Show me your morning proof! instead of “Take a selfie to confirm.”',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF004D4D),
                  height: 1.4,
                ),
              ),

              SizedBox(height: height * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExampleImage(
                    innerPath: 'assets/images/mug.jpg',
                    imagePath: 'assets/images/visible.png',
                    label: 'Clear visible',
                    icon: Icons.check,
                    iconColor: Colors.green,
                  ),
                  ExampleImage(
                    innerPath: 'assets/images/mug.jpg',
                    imagePath: 'assets/images/visible.png',
                    label: 'Not clear',
                    icon: Icons.close,
                    iconColor: Colors.red,
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A8A8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.35,
                    vertical: height * 0.018,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 300));
                  pickImage();
                },
                child: Text(
                  "Photo",
                  style: TextStyle(fontSize: width * 0.04, color: Colors.white),
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        );
      },
    );
  }

  void showCapturedImageSheet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (_) {
        return SizedBox(
          height: height * 0.85,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.065,
              vertical: height * 0.04,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Grey drag handle
                Container(
                  width: width * 0.12,
                  height: height * 0.007,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.045,
                    vertical: height * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(width * 0.08),
                  ),
                  child: Text(
                    "Photo",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.025),

                Text(
                  'Use that object again for picture to verify and stop Tsetse alarm',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(61, 90, 94, 1),
                    height: 1.4,
                  ),
                ),

                SizedBox(height: height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.36,
                      height: width * 0.36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF305E5B),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.white, size: 40),
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    if (_capturedImage != null)
                      Stack(
                        children: [
                          Container(
                            width: width * 0.36,
                            height: width * 0.36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              image: DecorationImage(
                                image: FileImage(_capturedImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.all(width * 0.015),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                SizedBox(height: height * 0.12),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.08),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.018,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Preview",
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF23CEA6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.08),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.018,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Complete",
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.025),
              ],
            ),
          ),
        );
      },
    );
  }
}
