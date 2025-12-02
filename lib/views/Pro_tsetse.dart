import 'package:flutter/material.dart';
import 'package:tsetse/Widgets/planCard.dart';
import 'package:tsetse/Widgets/procontainer.dart';
import 'package:tsetse/core/utils/app_colors.dart';
import 'package:tsetse/core/utils/svg_icon.dart';

class ProTsetse extends StatefulWidget {
  const ProTsetse({super.key});

  @override
  State<ProTsetse> createState() => _ProTsetseState();
}

class _ProTsetseState extends State<ProTsetse> {
  bool isYearlySelected = true;

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
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: width * 0.08,
                        color: AppColors.Tsetsecolor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Text(
                  'Start your 7-day free trial for Pro',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    color: AppColors.Tsetsecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              SvgIcon(
                'assets/icons/badge.svg',
                height: height * 0.22,
                width: width * 0.45,
              ),

              SizedBox(height: height * 0.05),

              buildPlanCard(
                isSelected: isYearlySelected,
                title: "Yearly",
                subtitle: "7-day free trial",
                priceMonthly: "\$5.50/month",
                oldPrice: "\$80.44",
                newPrice: "\$66 /year",
                badgeText: "30% Off",
                onTap: () {
                  setState(() {
                    isYearlySelected = true;
                  });
                },
              ),

              SizedBox(height: height * 0.02),

              buildPlanCard(
                isSelected: !isYearlySelected,
                title: "Monthly",
                subtitle: "No free trial included",
                priceMonthly: "\$6.50/month",
                oldPrice: null,
                newPrice: "\$73.23 /year",
                badgeText: null,
                onTap: () {
                  setState(() {
                    isYearlySelected = false;
                  });
                },
              ),

              SizedBox(height: height * 0.08),

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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProTsetse()),
                    // );
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
