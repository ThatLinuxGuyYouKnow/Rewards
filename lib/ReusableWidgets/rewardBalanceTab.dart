import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:flutter/material.dart';

class RewardBalanceTab extends StatelessWidget {
  final String cashbackBalance;
  RewardBalanceTab({super.key, required this.cashbackBalance});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.02),
            HighlightText(
              text: 'Total  CashBack  Earned :  ',
              textSize: 18,
            ),
            Divider(
              thickness: 2,
            ),
            HighlightText(text: '#'),
            HighlightText(
              text: cashbackBalance,
              textSize: 19,
            )
          ],
        ),
      ),
    );
  }
}
