import 'package:app_ban_gao/screen/account/detailifo.dart';
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
        body: Column(children: [
      Card(
          child: ListTile(
        leading: const Icon(Icons.account_box_outlined),
        title: const Text('Thông Tin Tài KhoảnKhoản'),
        onTap: () {
          [
            TextButton(
              onPressed: () {
                // chuyển hướng đến thông tin tài khoảnkhoản
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailifo(
                      title: "Thông Tin Tài Khoản",
                      onTitleChange: (newTitle) {},
                    ),
                  ),
                );
              },
              child: const Text('Đăng xuất'),
            ),
          ];
        },
      )),
      const SizedBox(
        height: 20,
      ),
      Card(
          child: ListTile(
        leading: const Icon(Icons.logout_sharp),
        title: const Text('Đăng Xuất'),
        onTap: () {
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
      ))
    ]));
  }
}
