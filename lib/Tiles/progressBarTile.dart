import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressBarTile extends StatelessWidget {
  final double cashBackTotal;
  final double goalCashback;

  const ProgressBarTile({
    Key? key,
    required this.cashBackTotal,
    required this.goalCashback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = (cashBackTotal / goalCashback).clamp(0.0, 1.0);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress to Free Repair',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '${cashBackTotal.toStringAsFixed(0)} / ${goalCashback.toStringAsFixed(0)}',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F6FA3),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2F6FA3)),
          ),
          SizedBox(height: 8),
          Text(
            'Earn ${goalCashback.toStringAsFixed(0)} total cashback for a free diagnostics and repair',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
