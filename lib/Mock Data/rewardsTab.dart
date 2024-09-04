import 'package:flutter/material.dart';

class RedeemTab extends StatelessWidget {
  RedeemTab({super.key});

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .01),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
