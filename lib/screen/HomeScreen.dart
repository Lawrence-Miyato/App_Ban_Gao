import 'package:app_ban_gao/screen/HomePage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    const Center(child: Text('Gioi Thieu')),
    const Center(child: Text('Tim Kiem')),
    const Center(child: Text('Gio Hang')),
    const Center(
      child: Text('Menu'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[100],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Tài KKhoản',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm Kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Giỏ Hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
