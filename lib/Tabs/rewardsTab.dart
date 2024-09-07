import 'package:balancee_rewards/Tiles/redeemBalanceTile.dart';
import 'package:flutter/material.dart';

class RedeemTab extends StatelessWidget {
  RedeemTab({super.key});

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
        child: Column(
          children: [RedeemBalanceTile()],
        ),
      ),
    );
  }
}
