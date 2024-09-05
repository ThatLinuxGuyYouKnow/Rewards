import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Enum to represent the type of cashback
enum CashBackType {
  cashBackIn,
  cashBackOut,
}

// ignore: must_be_immutable
class HistoryTile extends StatelessWidget {
  final CashBackType cashBackType;
  final String cashBackAmount; // Title (cashback amount)
  final String cashBackDetails; // Subtitle (details of cashback)

  HistoryTile({
    super.key,
    required this.cashBackType,
    required this.cashBackAmount,
    required this.cashBackDetails,
  });

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
      height: screenHeight * 0.082,
      width: screenWidth * .9,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getBackgroundColor(),
          child: Icon(
            _getIcon(),
            color: _getIconColor(),
          ),
        ),
        title: Text(
          cashBackAmount, // Dynamic cashback amount
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          cashBackDetails, // Dynamic cashback details
          style: GoogleFonts.plusJakartaSans(),
        ),
      ),
    );
  }

  // Get the icon based on the cashBackType
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

  // Get the background color based on the cashBackType
  Color _getBackgroundColor() {
    switch (cashBackType) {
      case CashBackType.cashBackIn:
        return Colors.green.withOpacity(0.3);
      case CashBackType.cashBackOut:
        return Colors.amber.withOpacity(0.2);
    }
  }
}
  //
