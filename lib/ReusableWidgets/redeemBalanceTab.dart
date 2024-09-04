import 'package:flutter/material.dart';

class RedeemBalanceTab extends StatelessWidget {
  RedeemBalanceTab({super.key});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .3,
      width: screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.blue)),
    );
  }
}
