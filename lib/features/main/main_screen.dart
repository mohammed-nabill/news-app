import 'package:flutter/material.dart';
import 'package:news_app/features/bookmark/bookmark_screen.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/search/search_screen.dart';

import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screenList = [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "Bookmark",
            icon: Icon(Icons.bookmark_border_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: _screenList[_currentIndex],
    );
  }
}
