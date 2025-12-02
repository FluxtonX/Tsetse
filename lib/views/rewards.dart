import 'package:flutter/material.dart';
import 'package:tsetse/core/utils/app_colors.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.07),

            // ---------- TITLE ----------
            Text(
              "Reward Center",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.Tsetsecolor,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Redeem Your Anti-Sleep Tokens",
              style: TextStyle(fontSize: 18, color: AppColors.subtittlecolor),
            ),

            SizedBox(height: height * 0.03),

            buildBalanceCard(width, height),

            SizedBox(height: height * 0.02),

            // ---------- STATS ----------
            Row(
              children: [
                Expanded(
                  child: buildStatCard(
                    "5 Days",
                    "Current Streak",
                    AppColors.subtittlecolor,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: buildStatCard(
                    "12 Days",
                    "Best Streak",
                    AppColors.Tsetsecolor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildStatCard(
                    "83 %",
                    "Success Rate",
                    Color.fromRGBO(255, 180, 17, 1),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: buildStatCard(
                    "24",
                    "Total Alarm",
                    Color.fromRGBO(235, 0, 122, 1),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),

            // ---------- REWARDS TITLE ----------
            Row(
              children: [
                Image.asset(
                  'assets/images/reward.png',
                  height: 30,
                  color: Color.fromRGBO(35, 77, 38, 1),
                ),
                SizedBox(width: 8),
                Text(
                  "Rewards",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.Tsetsecolor,
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.01),

            // ---------- REWARD CARDS ----------
            buildRewardItem(
              icon: Icons.music_note,
              title: "Study Playlist Unlocked",
              subtitle: "curated focus music just for you",
              price: 15,
              isLocked: true,
              image: AssetImage('assets/images/music.png'),
            ),

            buildRewardItem(
              icon: Icons.psychology_alt_outlined,
              title: "Brain Boost Tips",
              subtitle: "Science-backed productivity",
              price: 10,
              isLocked: false,
              image: AssetImage('assets/images/brain.png'),
            ),

            buildRewardItem(
              icon: Icons.music_note,
              title: "Ai Roast Message",
              subtitle: "Get a personalized wake-up roast",
              price: 15,
              isLocked: true,
              image: AssetImage('assets/images/music.png'),
            ),

            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget buildBalanceCard(double width, double height) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColors.Tsetsecolor, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Balance",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.subtittlecolor,
            ),
          ),
          Row(
            children: [
              Text(
                "10",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.subtittlecolor,
                ),
              ),
              SizedBox(width: 8),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 5,
                    child: Image.asset('assets/images/coin.png', height: 20),
                  ),
                  Image.asset('assets/images/coin.png', height: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStatCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.Tsetsecolor, width: 2),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget buildRewardItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required int price,
    required bool isLocked,
    required AssetImage image,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(18),
        border: Border(
          bottom: BorderSide(color: AppColors.Tsetsecolor, width: 2),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 37,
            decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                  height: 13.5,
                  color: isLocked ? Colors.black : AppColors.Tsetsecolor,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),

          // TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLocked ? "Locked" : "Claim",

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isLocked ? Colors.grey : AppColors.subtittlecolor,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 12,
                    color: isLocked ? Colors.grey : AppColors.subtittlecolor,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  Text(
                    "$price",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 5,
                        child: Image.asset(
                          'assets/images/coin.png',
                          height: 11,
                        ),
                      ),
                      Image.asset('assets/images/coin.png', height: 11),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: isLocked ? Colors.grey[300] : AppColors.Tsetsecolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isLocked ? "Locked" : "Claim",
                  style: TextStyle(
                    fontSize: 12,
                    color: isLocked ? Colors.grey : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
