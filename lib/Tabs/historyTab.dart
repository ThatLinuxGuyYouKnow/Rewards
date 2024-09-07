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
                (filter == 'In' ? 'cashBackIn' : 'cashBackOut'))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * .01,
              horizontal: screenWidth * .06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction History',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: currentFilter,
                  items: <String>['All', 'In', 'Out']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      _filterTransactions(newValue);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHistory.length,
              itemBuilder: (context, index) {
                final historyItem = filteredHistory[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.05,
                  ),
                  child: HistoryTile(
                    cashBackDetails: historyItem['description'],
                    cashBackAmount: '#${historyItem['amount']}',
                    cashBackType: historyItem['transactionType'] == 'cashBackIn'
                        ? CashBackType.cashBackIn
                        : CashBackType.cashBackOut,
                    date: DateTime.parse(historyItem['date']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
