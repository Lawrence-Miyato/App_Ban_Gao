import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/HomeScreen.dart';
import 'package:flutter/material.dart';

class Setttingpage extends StatefulWidget {
  const Setttingpage({super.key});

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            // Xác nhận đăng xuất
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Xác nhận'),
                content: const Text('Bạn có chắc chắn muốn đăng xuất không?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), // Đóng hộp thoại
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Đăng xuất và chuyển hướng đến màn hình đăng nhập
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(
                            title: "Bán Gạo 2024",
                            onTitleChange: (newTitle) {},
                            isLoggedIn: false, // Đã đăng xuất
                          ),
                        ),
                      );
                    },
                    child: const Text('Đăng xuất'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Đăng Xuất')),
    ));
  }
}
