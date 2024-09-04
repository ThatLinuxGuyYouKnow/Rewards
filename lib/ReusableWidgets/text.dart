import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StandardText extends StatelessWidget {
  final String text;
  final double? textSize;
  StandardText({super.key, required this.text, this.textSize = 14});
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.plusJakartaSans(fontSize: textSize));
  }
}

class HighlightText extends StatelessWidget {
  final String text;
  final double? textSize;
  HighlightText({super.key, required this.text, this.textSize = 16});
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: textSize,
            letterSpacing: 0.1));
  }
}
