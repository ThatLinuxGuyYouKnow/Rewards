import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryFilterButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  HistoryFilterButton(
      {super.key, required this.buttonText, required this.buttonIcon});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Row(
        children: [
          Text(
            buttonText,
            style: GoogleFonts.plusJakartaSans(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: screenWidth * .008),
          Icon(buttonIcon)
        ],
      ),
    );
  }
}
