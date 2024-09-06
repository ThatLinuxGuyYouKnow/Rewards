import 'package:balancee_rewards/Enums/cashBackType.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTile extends StatelessWidget {
  final CashBackType cashBackType;
  final String cashBackAmount;
  final String cashBackDetails;
  final DateTime date;

  const HistoryTile({
    Key? key,
    required this.cashBackType,
    required this.cashBackAmount,
    required this.cashBackDetails,
    required this.date,
  }) : super(key: key);

  @override
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
      height: screenHeight * 0.09,
      width: screenWidth * 0.9,
      child: ListTile(
        leading: Align(
          alignment: Alignment.center, // Aligns the CircleAvatar vertically
          child: CircleAvatar(
            backgroundColor: _getBackgroundColor(),
            child: Icon(
              _getIcon(),
              color: _getIconColor(),
            ),
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

  Color _getIconColor() {
    switch (cashBackType) {
      case CashBackType.cashBackIn:
        return Colors.green;
      case CashBackType.cashBackOut:
        return Colors.amber;
    }
  }

  Color _getBackgroundColor() {
    switch (cashBackType) {
      case CashBackType.cashBackIn:
        return Colors.green.withOpacity(0.3);
      case CashBackType.cashBackOut:
        return Colors.amber.withOpacity(0.2);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
