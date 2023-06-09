import 'package:flutter/material.dart';
import 'package:seekmax/core/theme/theme_color.dart';
import 'package:seekmax/features/available_jobs/presentation/pages/available_jobs_page.dart';
import 'package:seekmax/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs"),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      body: Container(
        child: _selectedIndex == 0 ? const AvailableJobsPage() : const ProfilePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeColor.brandBackground,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

const List<BottomNavigationBarItem> bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Available Jobs',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Profile',
  ),
];
