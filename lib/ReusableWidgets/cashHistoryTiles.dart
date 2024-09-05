import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For improved date formatting

enum CashBackType {
  cashBackIn,
  cashBackOut,
}

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
          ),
        ],
      ),
      height: screenHeight * 0.09, // Slightly increased height
      width: screenWidth * 0.9,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getBackgroundColor(),
          child: Icon(
            _getIcon(),
            color: _getIconColor(),
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
              _formatDate(date), // Using a more flexible date format
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

  // Improved date formatting using the intl package
  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
