import 'package:flutter/material.dart';

class HistoryFilterButton extends StatelessWidget {
  final String buttonText;
  HistoryFilterButton({super.key, required this.buttonText});
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(101)),
    );
  }
}
