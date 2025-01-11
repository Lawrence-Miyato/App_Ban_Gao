import 'package:app_ban_gao/screen/setting/DetailIfo.dart'; // Đảm bảo tên file là DetailInfo.dart
import 'package:app_ban_gao/screen/setting/HelpAndSupportPage.dart';
import 'package:flutter/material.dart';
import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/HomeScreen.dart';

class Setttingpage extends StatefulWidget {
  final bool isLoggedIn;

  const Setttingpage({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài Đặt')),
      body: ListView(
        children: [
          // Mục Tài Khoản
          const ListTile(title: Text("Tài Khoản")),
          Card(
            child: ListTile(
              title: const Text('Thông tin cá nhân'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(
                      username: 'Bán Gạo',
                      email: 'bangaongon@gmail.com',
                      gender: 'Nam',
                      phoneNumber: '0123456789',
                      birthDate: '08/06/1999',
                    ),
                  ),
                );
              },
            ),
          ),

          // Địa Chỉ
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              title: const Text('Địa Chỉ'),
              subtitle:
                  Text(userInfo.address), // Sử dụng địa chỉ từ DetailInfo.dart
            ),
          ),

          // Mục Cài Đặt
          const SizedBox(height: 10),
          const ListTile(title: Text("Cài Đặt")),

          Card(
            child: ListTile(
              title: const Text('Thông báo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
          ),

          // Đăng xuất
          if (widget.isLoggedIn)
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout_sharp, color: Colors.red),
                title: const Text('Đăng Xuất'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Xác nhận'),
                      content:
                          const Text('Bạn có chắc chắn muốn đăng xuất không?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Hủy'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homescreen(
                                  title: "Bán Gạo 2024",
                                  onTitleChange: (newTitle) {},
                                  isLoggedIn: false,
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
                title: const Text('Đăng Nhập'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
            ),

          // Các mục khác
          const SizedBox(height: 10),
          const ListTile(title: Text("Khác")),

          Card(
            child: ListTile(
              title: const Text('Trợ giúp & Yêu Cầu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpAndSupportPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String gender;
  final String phoneNumber;
  final String birthDate;

  const ProfilePage({
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông Tin Cá Nhân')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            // Avatar section with username
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey,
              child: Text(
                username[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // User Info
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Họ Tên: $username',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Email: $email',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.transgender, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Giới tính: $gender',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Số điện thoại: $phoneNumber',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.cake, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Ngày sinh: $birthDate',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<String> notifications = [
    'Đơn hàng của bạn đã được giao thành công.',
    'Sử dụng mã khuyến mãi "GAO2025" để giảm 10%.',
    'Đơn hàng của bạn đã được xác nhận.',
    'Đơn hàng bạn đã tới bưu cục Thủ Đức',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông Báo')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notifications[index]),
            ),
          );
        },
      ),
    );
  }
}
