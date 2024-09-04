import 'package:balancee_rewards/ReusableWidgets/rewardBalanceTab.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainRewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(
          length: 2, // Number of tabs
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Rewards',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.1),
              ),
              bottom: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(child: StandardText(text: 'Redeem', textSize: 16)),
                  Tab(child: StandardText(text: 'History', textSize: 16)),
                ],
              ),
            ),
            body: Stack(
              children: [
                TabBarView(
                  children: [
                    RedeemTab(), // Placeholder for Redeem tab content
                    HistoryTab(), // Placeholder for History tab content
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RewardBalanceTab(
                        cashbackBalance: '20000',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RedeemTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0), // Adjust to prevent overlap
      child: Center(
        child: Text('Redeem Tab Content'), // Replace with actual content
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0), // Adjust to prevent overlap
      child: Center(
        child: Text('History Tab Content'), // Replace with actual content
      ),
    );
  }
}
