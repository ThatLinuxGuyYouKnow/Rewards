import 'package:balancee_rewards/Tiles/discountTile.dart';
import 'package:balancee_rewards/Tiles/progressBarTile.dart';
import 'package:balancee_rewards/Tiles/promoCodeTile.dart';
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
          children: [
            SizedBox(
              height: screenHeight * .02,
            ),
            ProgressBarTile(),
            SizedBox(
              height: screenHeight * .02,
            ),
            PromoCodeTile(
              subtitle: 'Promo Codes are not transferrable between users',
              title: 'Convert To Promo Code',
            ),
            SizedBox(height: screenHeight * .02),
            DiscountTile()
          ],
        ),
      ),
    );
  }
}
