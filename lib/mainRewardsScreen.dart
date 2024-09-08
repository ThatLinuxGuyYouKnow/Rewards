import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:balancee_rewards/Tabs/historyTab.dart';
import 'package:balancee_rewards/Tabs/rewardsTab.dart';
import 'package:balancee_rewards/Tiles/rewardBalanceTiles.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';

class MainRewardsScreen extends StatefulWidget {
  const MainRewardsScreen({super.key});

  @override
  _MainRewardsScreenState createState() => _MainRewardsScreenState();
}

class _MainRewardsScreenState extends State<MainRewardsScreen> {
  late Map<String, dynamic> mockData;
  bool isLoading = true; // For loading state

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  Future<void> _loadMockData() async {
    // Load the mock data from the JSON file in assets
    final String response = await rootBundle
        .loadString('lib/MockData/cashBackHistoryEnquiryResponse.json');
    final data = json.decode(response); // Parse the JSON
    setState(() {
      mockData = data['data']; // Extract the relevant part of the mock data
      isLoading = false; // Loading is finished
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return Center(child: CircularProgressIndicator()); // Show loading spinner
    }

    // Access the cashback balance from the mock data
    String cashbackBalance = mockData['cashbackBalance'].toString();

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
                    backgroundColor: Colors.white,
                    title: Text(
                      'Rewards',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color(0xFF2F6FA3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    pinned: true, // Keeps the TabBar pinned at the top
                    floating: false,
                    expandedHeight: screenHeight * 0.33, // Increased height
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.07,
                            ),

                            // Pass the dynamically loaded cashback balance to the RewardBalanceTab widget
                            RewardBalanceTab(
                              cashbackBalance:
                                  cashbackBalance, // Loaded dynamically from mock data
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.012),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.06,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottom: TabBar(
                      indicatorColor: Color(0xFF2F6FA3),
                      labelColor: Color(0xFF2F6FA3),
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
