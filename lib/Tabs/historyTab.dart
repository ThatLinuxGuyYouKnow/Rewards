import 'dart:convert';
import 'package:balancee_rewards/Enums/cashBackType.dart';
import 'package:balancee_rewards/ReusableWidgets/HistoryFilterButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:balancee_rewards/Tiles/cashHistoryTiles.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  List<dynamic> cashbackHistory = [];
  List<dynamic> filteredHistory = [];
  String currentFilter = 'All';

  @override
  void initState() {
    super.initState();
    _loadCashbackHistory();
  }

  Future<void> _loadCashbackHistory() async {
    final String response = await rootBundle
        .loadString('lib/MockData/cashBackHistoryEnquiryResponse.json');
    final data = json.decode(response);
    setState(() {
      cashbackHistory = data['data']['cashbackHistory'];
      filteredHistory = cashbackHistory;
    });
  }

  void _filterTransactions(String filter) {
    setState(() {
      currentFilter = filter;
      if (filter == 'All') {
        filteredHistory = cashbackHistory;
      } else {
        filteredHistory = cashbackHistory
            .where((item) =>
                item['transactionType'] ==
                (filter == 'cashBackIn' ? 'cashBackIn' : 'cashBackOut'))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * .02,
          ),
          HistoryTile(
            cashBackType: CashBackType.cashBackIn,
            cashBackAmount: '2000000',
            cashBackDetails: 'cashBackDetails',
            date: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
