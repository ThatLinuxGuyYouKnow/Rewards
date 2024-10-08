import 'package:balancee_rewards/Enums/cashBackType.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTile extends StatelessWidget {
  final CashBackType cashBackType;
  final String cashBackAmount;
  final String cashBackDetails;
  final DateTime date;

  const HistoryTile({
    super.key,
    required this.cashBackType,
    required this.cashBackAmount,
    required this.cashBackDetails,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
          )
        ],
      ),
      height: screenHeight * 0.08,
      width: screenWidth * 0.9,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF2F6FA3).withOpacity(.2),
          child: Icon(
            _getIcon(),
            color: Color(0xFF2F6FA3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cashBackAmount,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _formatDate(date),
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        subtitle: Text(
          cashBackDetails,
          style: GoogleFonts.plusJakartaSans(),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (cashBackType) {
      case CashBackType.cashBackIn:
        return Icons.add;
      case CashBackType.cashBackOut:
        return Icons.remove;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
