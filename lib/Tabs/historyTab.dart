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
            height: screenHeight * 0.3,
          ),
          HistoryTile()
        ],
      ),
    );
  }
}
