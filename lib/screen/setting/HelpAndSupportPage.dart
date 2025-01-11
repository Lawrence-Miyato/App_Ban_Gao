import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trợ Giúp & Yêu Cầu'),
        backgroundColor:
            Colors.pink[200], // Đổi màu thanh AppBar cho hài hòa hơn
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần liên hệ qua email
            Row(
              children: [
                Icon(Icons.email,
                    color: Colors.blue, size: 24), // Icon cho email
                SizedBox(width: 8),
                Flexible(
                  // Dùng Flexible để cho phép Text xuống dòng khi cần thiết
                  child: Text(
                    'Vui lòng liên hệ với chúng tôi qua Email:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    softWrap: true, // Cho phép xuống dòng
                    overflow:
                        TextOverflow.visible, // Đảm bảo văn bản không bị cắt
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'bangaongon@bangaongon.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 8),
            // Phần liên hệ qua số điện thoại
            Row(
              children: [
                Icon(Icons.phone,
                    color: Colors.green, size: 24), // Icon cho số điện thoại
                SizedBox(width: 8),
                Text(
                  'Hoặc qua số hotline:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '0123456789',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' || ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' 0987654321',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Phần kết thúc hỗ trợ
            Row(
              children: [
                Icon(Icons.support_agent,
                    color: Colors.orange, size: 24), // Icon hỗ trợ
                SizedBox(width: 8),
                Text(
                  'để được hỗ trợ kịp thời',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
