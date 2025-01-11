import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String gender;
  final String phoneNumber;
  final String birthDate;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.email,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông Tin Cá Nhân')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
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
