import 'package:balancee_rewards/ReusableWidgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardBalanceTab extends StatelessWidget {
  final String cashbackBalance;
  RewardBalanceTab({super.key, required this.cashbackBalance});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
          color: Color(0xFF2F6FA3), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.02),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: screenWidth * 0.005),
                  HighlightText(
                    text: 'Current CashBack Balance :  ',
                    textSize: 18,
                  ),
                  HighlightText(text: '#'),
                  HighlightText(
                    text: cashbackBalance,
                    textSize: 19,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              WithdrawCashBackBalance()
            ],
          ),
        ),
      ),
    );
  }
}

class WithdrawCashBackBalance extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        child: Container(
      child: Center(
        child: Text('Withdraw',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F6FA3))),
      ),
      height: screenHeight * 0.04,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.white, spreadRadius: 3, blurStyle: BlurStyle.outer)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    ));
  }
}
