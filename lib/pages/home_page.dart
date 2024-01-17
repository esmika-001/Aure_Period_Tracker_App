import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Calender_page.dart';
import 'History_page.dart';
import 'Setting_page.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

BottomNavigationBarItem _buildBottomNavigationBarItem(
    IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.pink.withOpacity(0.25),
      ),
      child: Icon(icon),
    ),
    label: label,
  );
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? DateFormat('EEE, dd MMM').format(selectedDate!)
        : 'Today';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Period Tracker'),
              background: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'Aura.png', // Replace with your photo asset path
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 50),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Text(
                            '$formattedDate',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '5 days until your next period',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select period Date'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem(Icons.calendar_today, 'Calendar'),
          _buildBottomNavigationBarItem(Icons.list, 'History'),
          _buildBottomNavigationBarItem(Icons.chat, 'Chat'),
          _buildBottomNavigationBarItem(Icons.account_box, 'About'),
        ],
        selectedItemColor:
            Color.fromARGB(255, 0, 0, 0), // Change the color of selected icons
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        selectedLabelStyle: TextStyle(
            color: Color.fromARGB(
                255, 0, 21, 247)), // Change the color of selected text
        unselectedLabelStyle: TextStyle(
            color: const Color.fromARGB(
                255, 247, 2, 2)), // Change the color of unselected icons
        onTap: (index) {
          // Handle navigation based on the tapped index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
