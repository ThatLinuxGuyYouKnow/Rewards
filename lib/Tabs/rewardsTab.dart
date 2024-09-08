import 'dart:convert';
import 'package:balancee_rewards/Tiles/earnMoreTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:balancee_rewards/Tiles/discountTile.dart';
import 'package:balancee_rewards/Tiles/progressBarTile.dart';
import 'package:balancee_rewards/Tiles/promoCodeTile.dart';
import 'package:balancee_rewards/Tiles/redeemBalanceTile.dart';

class RedeemTab extends StatefulWidget {
  RedeemTab({super.key});

  @override
  _RedeemTabState createState() => _RedeemTabState();
}

class _RedeemTabState extends State<RedeemTab> {
  late Map<String, dynamic> mockData; // To store loaded data
  bool isLoading = true; // To manage loading state

  @override
  void initState() {
    super.initState();
    _loadMockData(); // Load mock data when the widget initializes
  }

  Future<void> _loadMockData() async {
    // Load the mock data from the JSON file in assets
    final String response = await rootBundle
        .loadString('lib/MockData/cashBackHistoryEnquiryResponse.json');
    final data = json.decode(response); // Parse the JSON
    setState(() {
      mockData = data['data']; // Assign the relevant part of the mock data
      isLoading = false; // Loading finished
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return Center(
          child:
              CircularProgressIndicator()); // Show loading spinner while data is being fetched
    }

    // Access mock data fields for the widgets
    int currentCashback = mockData['cashbackBalance']; // Cashback balance
    int cashBackTotal = mockData['totalCashback'];
    int goalCashback = mockData['cashback_goal']; // Total cashback goal

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * .02),
            // Progress bar showing cashback progress
            ProgressBarTile(
              cashBackTotal: cashBackTotal.toDouble(),
              goalCashback: goalCashback.toDouble(),
            ),
            SizedBox(height: screenHeight * .02),

            PromoCodeTile(
              subtitle: 'Promo Codes are not transferrable between users',
              title: 'Convert to Promo Code',
            ),
            SizedBox(height: screenHeight * .02),

            DiscountTile(),
            SizedBox(height: screenHeight * .02),
            EarnMoreTile()
          ],
        ),
      ),
    );
  }
}
