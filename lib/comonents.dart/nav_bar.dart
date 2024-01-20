import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/screens/add_trasaction_screen.dart';
import 'package:spendwise/screens/another_screen.dart';
import 'package:spendwise/screens/home_screen.dart';
import 'package:spendwise/screens/report_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Screens = [
    NewTransactionScreen(),
    HomeScreen(),
    ReportScreen(),
  ];
  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.analytics, size: 30),
          // Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Screens[_page],
    );
  }
}
