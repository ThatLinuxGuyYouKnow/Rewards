import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnMoreTile extends StatelessWidget {
  final Color iconColor;

  final VoidCallback? onTap;

  const EarnMoreTile({
    Key? key,
    this.iconColor = const Color(0xFF2F6FA3),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.11,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 2)
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.05),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF2F6FA3).withOpacity(.2),
              child: Icon(
                size: 25,
                Icons.paid,
                color: iconColor,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earn More',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.007),
                  Text(
                    'Keep booking via the Balanceé app to keep earning',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.black26,
              size: 42,
            ),
            SizedBox(
              width: screenWidth * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
