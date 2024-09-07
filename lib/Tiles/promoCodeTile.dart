import 'package:flutter/material.dart';

class PromoCodeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 2)
          ]),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF2F6FA3), // Hex color for background
          child: Icon(
            Icons.discount,
            color: Color(0xFF2F6FA3), // Hex color for icon
          ),
        ),
      ),
    );
  }
}
