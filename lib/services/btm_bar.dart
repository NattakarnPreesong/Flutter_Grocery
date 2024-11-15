import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart'; // Make sure you add this package for icons

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0; // Initialize the selected index

  // Define your pages list with corresponding title and widget
  static final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Home',
      'page': Center(child: Text('Home Page')), // Example page widget
    },
    {
      'title': 'Profile',
      'page': Center(child: Text('Profile Page')), // Example page widget
    },
    // Add more pages as needed
  ];

  // Define the function to handle tap on bottom navigation items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']), // Show selected page title
      ),
      body: _pages[_selectedIndex]['page'], // Show selected page content
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex, // Set the current index
        unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: isDark ? Colors.white : Colors.black87,
        onTap: _onItemTapped, // Handle tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.profile),
            label: "Profile",
          ),
          // Add more items if necessary
        ],
      ),
    );
  }
}
