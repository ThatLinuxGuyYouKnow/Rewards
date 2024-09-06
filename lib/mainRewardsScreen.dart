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
                    title: Text(
                      'Rewards',
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    pinned: true, // Keeps the TabBar pinned at the top
                    floating: false,
                    expandedHeight: screenHeight * 0.35, // Increased height
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    screenHeight * 0.07), // Increased the space

                            // Adjusted spacing
                            RewardBalanceTab(
                              cashbackBalance: '90000', // Pass balance here
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.01),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  Text('Total CashBack Earned',
                                      style: GoogleFonts.plusJakartaSans()),
                                ],
                              ),
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
