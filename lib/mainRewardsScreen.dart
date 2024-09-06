import 'package:balancee_rewards/Tiles/redeemBalanceTabPage.dart';
import 'package:balancee_rewards/Tiles/rewardBalanceTiles.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:balancee_rewards/Tabs/historyTab.dart';
import 'package:balancee_rewards/Tabs/rewardsTab.dart';
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
                    Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.12,
                        ),
                        RedeemTab(),
                      ],
                    ), // Placeholder for Redeem tab content
                    HistoryTab(), // Placeholder for History tab content
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.005),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.06,
                          ),
                          Text(
                            'Total CasBack Earned:',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.001,
                          ),
                          Text(
                            '1000',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RewardBalanceTab(
                            cashbackBalance: '20000',
                          ),
                        ],
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
