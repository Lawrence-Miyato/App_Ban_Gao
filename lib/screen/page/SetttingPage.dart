import 'package:app_ban_gao/screen/login/LoginPage.dart';
import 'package:app_ban_gao/screen/page/HomeScreen.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
// import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

// void main() {
//   // Require Hybrid Composition mode on Android.
//   final GoogleMapsFlutterPlatform mapsImplementation =
//       GoogleMapsFlutterPlatform.instance;
//   if (mapsImplementation is GoogleMapsFlutterAndroid) {
//     // Force Hybrid Composition mode.
//     mapsImplementation.useAndroidViewSurface = true;
//   }
//   // ···
// }

class Setttingpage extends StatefulWidget {
  final bool isLoggedIn;

  const Setttingpage({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  bool isDarkMode = false; // Biến kiểm soát chế độ tối

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cài Đặt')),
      body: ListView(
        children: [
          // Chế độ tối
          SwitchListTile(
            title: const Text('Chế độ tối'),
            value: isDarkMode,
            onChanged: (bool value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),

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
          const Card(child: ListTile(title: Text('Địa Chỉ'))),

          // Liên kết Thẻ Ngân Hàng
          const SizedBox(height: 10),
          const Card(child: ListTile(title: Text('Liên kết Thẻ Ngân Hàng'))),

          // Mục Cài Đặt
          const SizedBox(height: 10),
          const ListTile(title: Text("Cài Đặt")),
          const Card(child: ListTile(title: Text('Bảo Mật'))),
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
                title: const Text('Đăng Xuất'),
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

          // Card(
          //   child: ListTile(
          //     title: const Text('Quản lý đơn hàng'),
          //     onTap: () {
          //       // Chuyển hướng đến màn hình quản lý đơn hàng
          //     },
          //   ),
          // ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username'),
            const SizedBox(height: 16),
            Text('Email: $email'),
            const SizedBox(height: 20),
            Text('Giới tính: $gender'),
            const SizedBox(height: 16),
            Text('Số điện thoại: $phoneNumber'),
            const SizedBox(height: 16),
            Text('Ngày sinh: $birthDate'),
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

// class OrderManagementPage extends StatelessWidget {
//   final List<String> orders = [
//     'Đơn hàng 1: Gạo 5kg - Đang giao.',
//     'Đơn hàng 2: Gạo 10kg - Đã giao.',
//     'Đơn hàng 3: Gạo 3kg - Đang chuẩn bị.',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Quản lý Đơn Hàng')),
//       body: ListView.builder(
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(orders[index]),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trợ Giúp & Yêu Cầu')),
      body: const Padding(
        padding: EdgeInsets.all(16.0), // Thêm khoảng cách từ các cạnh
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
          children: [
            Text(
              'Vui lòng liên hệ với chúng tôi qua Email: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Màu văn bản
              ),
            ),
            SizedBox(height: 8), // Tạo khoảng cách giữa các phần
            Text(
              'bangaongon@bangaongon.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue, // Màu sắc cho Email
                decoration: TextDecoration.underline, // Gạch chân Email
              ),
            ),
            SizedBox(height: 16), // Tạo khoảng cách giữa các phần
            Text(
              'Hoặc qua số hotline: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Màu văn bản
              ),
            ),
            SizedBox(height: 8),
            Text(
              '0123456789 hay 0987654321',
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple, // Màu sắc cho số hotline
                decoration: TextDecoration.underline, // Gạch chân Email
                fontWeight: FontWeight.bold, // Làm nổi bật số điện thoại
              ),
            ),
            SizedBox(height: 8),
            Text(
              'để được hỗ trợ kịp thời',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black, // Màu sắc cho số hotline
                fontWeight: FontWeight.bold, // Làm nổi bật số điện thoại
              ),
            ),
          ],
        ),
      ),
    );
  }
}
