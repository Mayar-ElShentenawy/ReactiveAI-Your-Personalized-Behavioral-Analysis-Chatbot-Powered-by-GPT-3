import 'package:flutter/material.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter_app_grad/Profile/View/profile_screen.dart';
import 'Home/View/home_screen.dart';
import 'Chat/View/chat.dart';
import 'statistics/View/statistics.dart';

class Nav extends StatefulWidget {
  int selectedIndex;
  Nav({required this.selectedIndex}) : super(key: ValueKey(selectedIndex));

  @override
  State<Nav> createState() => _NavState(selectedIndex: selectedIndex);
}

class _NavState extends State<Nav> {
  // This widget is the root of your application.
  int selectedIndex;
  _NavState({required this.selectedIndex}) : super();

  static List<Widget> _screens = <Widget>[
    Home(),
    ChatPage(),
    StatsScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomBarBubble(
        selectedIndex: selectedIndex,
        items: [
          BottomBarItem(
            iconData: Icons.home,
            // label: 'Home',
          ),
          BottomBarItem(
            iconData: Icons.chat,
            // label: 'Chat',
          ),
          BottomBarItem(
            iconData: Icons.analytics,
            // label: 'Notification',
          ),
          // BottomBarItem(
          //   iconData: Icons.logout,
          //   // label: 'Calendar',
          // ),
          BottomBarItem(
            iconData: Icons.account_circle,
            // label: 'Setting',
          ),
        ],
        onSelect: (index) {
          setState(() {
            selectedIndex = index;
          });
          // implement your select function here
        },
      ),
    );
  }
}
