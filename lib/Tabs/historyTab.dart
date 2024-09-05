import 'package:balancee_rewards/ReusableWidgets/cashHistoryTiles.dart';
import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.22,
          ),
          HistoryTile(
            cashBackDetails: 'Reward for Completing App',
            cashBackAmount: ' #200000',
            cashBackType: CashBackType.cashBackIn,
          ),
          SizedBox(height: screenHeight * 0.02),
          HistoryTile(
            cashBackDetails: 'Repairs Booked through app',
            cashBackAmount: ' # 74 500',
            cashBackType: CashBackType.cashBackIn,
          ),
          SizedBox(height: screenHeight * 0.02),
          HistoryTile(
            cashBackDetails: 'CashBack Withdrawn',
            cashBackAmount: ' # 143 000',
            cashBackType: CashBackType.cashBackOut,
          )
        ],
      ),
    );
  }
}
