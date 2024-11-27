import 'package:flutter/material.dart';
import 'package:i_am_cooked/pages/login.dart';
import 'package:i_am_cooked/pages/profile_page.dart';
import 'home_page.dart';
import 'stats_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const StatsPage(),
    ProfilePage(),
    // LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.home : Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.bar_chart : Icons.bar_chart_outlined,
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.person : Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),


    );
  }
}