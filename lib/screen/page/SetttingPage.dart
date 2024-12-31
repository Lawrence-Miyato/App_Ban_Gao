import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/HomeScreen.dart';
import 'package:flutter/material.dart';

class Setttingpage extends StatefulWidget {
  final bool isLoggedIn; // Kiểm tra trạng thái đăng nhập

  const Setttingpage({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text("Tài Khoản"),
              ),
              const Card(
                child: ListTile(
                  title: Text('Tài Khoản & Bảo Mật'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: ListTile(
                  title: Text('Địa Chỉ'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: ListTile(
                  title: Text('Tài Khoản / Thẻ Ngân Hàng'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text("Cài Đặt"),
              ),
              const Card(
                child: ListTile(
                  title: Text('Cài Đặt Chat'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Hiển thị Card Đăng Xuất nếu người dùng đã đăng nhập
              if (widget.isLoggedIn)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.logout_sharp, color: Colors.red),
                    title: const Text('Đăng Xuất'),
                    onTap: () {
                      // Xác nhận đăng xuất
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Xác nhận'),
                          content: const Text(
                              'Bạn có chắc chắn muốn đăng xuất không?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context), // Đóng hộp thoại
                              child: const Text('Hủy'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Đóng hộp thoại
                                Navigator.pop(context);

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
                  ),
                )
              else
                Card(
                  child: ListTile(
                    title: const Text('Đăng Nhập / Đăng Ký'),
                    onTap: () {
                      // Chuyển hướng đến màn hình đăng nhập
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
