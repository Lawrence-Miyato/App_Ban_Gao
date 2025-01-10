import 'package:app_ban_gao/screen/menu/Menu.dart';
import 'package:app_ban_gao/screen/page/FindPage.dart';
import 'package:app_ban_gao/screen/page/HomePage.dart';
import 'package:app_ban_gao/screen/page/SetttingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:app_ban_gao/screen/shopping/Cart.dart';
import 'package:app_ban_gao/screen/shopping/CartModel.dart';

class Homescreen extends StatefulWidget {
  final String title;
  final Function(String) onTitleChange;
  final bool isLoggedIn;

  const Homescreen({
    Key? key,
    required this.title,
    required this.onTitleChange,
    this.isLoggedIn = false,
  }) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Homepage(), // Trang Thông Tin
      const Menu(), // Trang Sản Phẩm
      Setttingpage(isLoggedIn: widget.isLoggedIn), // Trang Cài Đặt
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          widget.onTitleChange('Thông Tin');
          break;
        case 1:
          widget.onTitleChange('Sản Phẩm');
          break;
        case 2:
          widget.onTitleChange('Thiết Lập Tài Khoản');
          break;
      }
    });
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FindPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[200],
        actions: _currentIndex == 2
            ? null
            : [
                if (_currentIndex == 0)
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _openSearch,
                  ),
                if (_currentIndex == 1)
                  Consumer<CartModel>(
                    builder: (context, cartModel, child) {
                      return badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeContent: Text(
                          cartModel.itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        showBadge: cartModel.itemCount > 0,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cart(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
              ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outlined),
            label: 'Giới Thiệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Sản Phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: 'Cài Đặt',
          ),
        ],
      ),
    );
  }
}
