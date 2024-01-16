import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  static const Color lightPink = Color.fromARGB(255, 255, 221, 232);
  static const Color visualBoxBackground = Color.fromARGB(255, 255, 144, 179);

  final int cycleDuration = 28;
  final int periodLength = 5;
  final List<DateTime> cycleHistory = [
    DateTime(2023, 12, 1),
    DateTime(2023, 12, 29),
    DateTime(2024, 1, 26),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDetailBox('Cycle Duration', '$cycleDuration days', true),
            SizedBox(height: 16),
            _buildDetailBox('Period Length', '$periodLength days', true),
            SizedBox(height: 16),
            _buildHistoryBox(),
            SizedBox(height: 16),
            _buildCycleHistoryVisual(),
          ],
        ),
      ),
      backgroundColor: lightPink,
    );
  }

  Widget _buildDetailBox(String title, String value, bool isNormal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              isNormal ? '✔' : '!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isNormal ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildHistoryBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cycle History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        if (cycleHistory.isNotEmpty)
          Column(
            children: cycleHistory
                .map((date) => _buildCycleHistoryItem(date))
                .toList(),
          )
        else
          Text('No cycle history available'),
      ],
    );
  }

  Widget _buildCycleHistoryItem(DateTime date) {
    return ListTile(
      title: Text(
        'Cycle on ${DateFormat('MMMM dd, yyyy').format(date)}',
        style: TextStyle(fontSize: 16),
      ),
      // Add more details or actions as needed
    );
  }

  Widget _buildCycleHistoryVisual() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: visualBoxBackground, // Light pink background
        border: Border.all(color: Colors.white), // White borders
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cycle History Visual',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDayVisual('Period Day', Colors.red),
          _buildDayVisual('Ovulation Day', Colors.blue),
          _buildDayVisual('Normal Day', Colors.green),
        ],
      ),
    );
  }

  Widget _buildDayVisual(String label, Color color) {
    return Column(
      children: [
        Divider(), // Add divider between day visuals
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
