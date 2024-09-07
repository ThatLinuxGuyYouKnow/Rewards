import 'package:flutter/material.dart';

class ProgressBarTile extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
          )
        ],
      ),
      height: screenHeight * 0.06,
      width: screenWidth * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .06),
          child: LinearProgressIndicator(
            color: Color(0xFF2F6FA3),
            borderRadius: BorderRadius.circular(17),
            value: 0.8,
          ),
        ),
      ),
    );
  }
}
