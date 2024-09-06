import 'dart:convert';
import 'package:balancee_rewards/ReusableWidgets/HistoryFilterButtons.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:balancee_rewards/Tiles/cashHistoryTiles.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  List<dynamic> cashbackHistory = [];

  @override
  void initState() {
    super.initState();
    _loadCashbackHistory();
  }

  Future<void> _loadCashbackHistory() async {
    // Load the mock data from the JSON file
    final String response = await rootBundle
        .loadString('lib/MockData/cashBackHistoryEnquiryResponse.json');
    final data = json.decode(response); // Parse the JSON
    setState(() {
      cashbackHistory =
          data['data']['cashbackHistory']; // Extract the cashback history
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenHeight * .22),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .01),
              child: Row(children: [
                HistoryFilterButton(
                  buttonText: 'All',
                )
              ]),
            ),
          ),
          // Build HistoryTile widgets dynamically from the parsed cashbackHistory
          ...cashbackHistory.map((historyItem) {
            return Column(
              children: [
                HistoryTile(
                  cashBackDetails:
                      historyItem['description'], // Description from the data
                  cashBackAmount:
                      ' #${historyItem['amount']}', // Format the amount
                  cashBackType: historyItem['transactionType'] == 'cashBackIn'
                      ? CashBackType.cashBackIn
                      : CashBackType.cashBackOut,
                  date: DateTime.parse(
                      historyItem['date']), // Parse the date string
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
