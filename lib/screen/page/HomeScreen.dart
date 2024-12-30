import 'package:app_ban_gao/screen/menu/Menu.dart';
import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/FindPage.dart'; // Đảm bảo đã import FindPage
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
    this.isLoggedIn = false, // Mặc định là chưa đăng nhập
  }) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(), // Trang Thông Tin
    const Menu(), // Trang Sản Phẩm
    const Setttingpage(), // Trang Cài Đặt
    const LoginPage(), // Trang Đăng Nhập
  ];

  // Logic xác định trạng thái navigation
  int navigationState() {
    return widget.isLoggedIn ? 1 : 2;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        widget.onTitleChange('Thông Tin');
      } else if (index == 1) {
        widget.onTitleChange('Sản Phẩm');
      } else if (index == 2) {
        widget.onTitleChange('Cài Đặt');
      } else if (index == 3 && navigationState() == 2) {
        widget.onTitleChange('Đăng Ký / Đăng Nhập');
      }
    });
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Findpage()), // Chuyển hướng tới FindPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[200],
        actions: _currentIndex == 2 || _currentIndex == 3
            ? null // Không hiển thị nút trên trang Đăng Nhập và Cài Đặt
            : [
                if (_currentIndex == 1) ...[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _openSearch, // Khi ấn vào, gọi hàm _openSearch
                  ),
                  Consumer<CartModel>(
                    builder: (context, cartModel, child) {
                      return badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeContent: Text(
                          cartModel.itemCount.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        showBadge: cartModel.itemCount > 0,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            // Chuyển hướng tới giỏ hàng
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Cart()),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ] else
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _openSearch, // Khi ấn vào, gọi hàm _openSearch
                  ),
              ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: navigationState() == 1
            ? const <BottomNavigationBarItem>[
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
              ]
            : const <BottomNavigationBarItem>[
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp),
                  label: 'Đăng Nhập',
                ),
              ],
      ),
    );
  }
}
