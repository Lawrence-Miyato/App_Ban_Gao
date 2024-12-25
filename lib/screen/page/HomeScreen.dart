import 'package:app_ban_gao/screen/Menu/Menu.dart';
import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/FindPage.dart'; // Đảm bảo đã import FindPage
import 'package:app_ban_gao/screen/page/HomePage.dart';
import 'package:app_ban_gao/screen/page/SetttingPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  final String title;
  final Function(String) onTitleChange;

  const Homescreen({
    Key? key,
    required this.title,
    required this.onTitleChange,
  }) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Khởi tạo index để xác định trang hiện tại
  int _currentIndex = 0;

  // Danh sách các widget đại diện cho các trang tương ứng
  final List<Widget> _pages = [
    Homepage(), //Trang Thông Tin
    const Menu(), // Trang Sản Phẩm
    const LoginPage(), //Trang Đăng Nhập
    const Setttingpage(), //Trang Cài Đặt
  ];

  // Hàm xử lý thay đổi màn hình
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Cập nhật tiêu đề theo màn hình đã chọn
      if (index == 0) {
        widget.onTitleChange('Thông Tin');
      } else if (index == 1) {
        widget.onTitleChange('Sản Phẩm');
      } else if (index == 2) {
        widget.onTitleChange('Đăng Nhập / Đăng Ký');
      } else if (index == 3) {
        widget.onTitleChange('Cài Đặt');
      }
    });
  }

  // Hàm mở trang tìm kiếm (chuyển hướng đến FindPage)
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
        actions: [
          // Nút tìm kiếm chuyển hướng tới FindPage
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _openSearch, // Khi ấn vào, gọi hàm _openSearch
          ),
        ],
      ),
      body: _pages[_currentIndex], // Hiển thị trang tương ứng với index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Chỉ mục của tab hiện tại
        onTap: _onItemTapped, // Hàm xử lý khi người dùng chọn tab
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
            icon: Icon(Icons.account_circle_sharp),
            label: 'Đăng Nhập',
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
