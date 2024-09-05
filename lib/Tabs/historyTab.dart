import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:balancee_rewards/ReusableWidgets/cashHistoryTiles.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.22),
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
                  date: historyItem['date'],
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
