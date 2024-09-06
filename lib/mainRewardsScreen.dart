import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:balancee_rewards/Tabs/historyTab.dart';
import 'package:balancee_rewards/Tabs/rewardsTab.dart';
import 'package:balancee_rewards/Tiles/rewardBalanceTiles.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';

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
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true, // Keeps the TabBar pinned at the top
                    floating: false,
                    expandedHeight:
                        screenHeight * 0.28, // Adjust height for header
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Cashback Earned:',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  '1000',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            RewardBalanceTab(
                              cashbackBalance: '20000', // Pass balance here
                            ),
                          ],
                        ),
                      ),
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
                ];
              },
              body: TabBarView(
                children: [
                  RedeemTab(), // Placeholder for Redeem tab content
                  HistoryTab(), // Placeholder for History tab content
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
