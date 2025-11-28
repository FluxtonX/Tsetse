import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/procontainer.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/views/Pro_next.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({super.key});

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.08),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pro_container(),

                    Icon(
                      Icons.close,
                      size: width * 0.08,
                      color: AppColors.Tsetsecolor,
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Text(
                  'One alarm is enough with TSETSE Pro',
                  style: TextStyle(
                    fontSize: width * 0.08,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),

              pro_container(),

              SizedBox(height: height * 0.03),

              Image.asset(
                'assets/images/Group 92.png',
                width: width * 0.8,
                height: height * 0.4,
                fit: BoxFit.contain,
              ),

              SizedBox(height: height * 0.06),

              SizedBox(
                width: width * 0.65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C4CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.08),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProNext()),
                    );
                  },
                  child: Text(
                    "Start my free week",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.01),

              Text(
                'Not charge until trial ends',
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subtittlecolor,
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
