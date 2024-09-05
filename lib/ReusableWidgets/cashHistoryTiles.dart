import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  HistoryTile({super.key});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: screenHeight * 0.1,
      width: screenWidth * .9,
      child: ListTile(
        title: Text('+ 1000'),
        subtitle: Text(''),
      ),
    );
  }
}
