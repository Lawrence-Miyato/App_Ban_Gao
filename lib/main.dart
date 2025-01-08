import 'package:app_ban_gao/screen/page/HomeScreen.dart';
import 'package:app_ban_gao/screen/shopping/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Khởi chạy ứng dụng với cấu hình Provider
  runApp(AppWithProviders());
}

class AppWithProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        // Thêm các Provider khác tại đây nếu cần
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTitle = 'Bán Gạo 2024'; // Tiêu đề ban đầu

  // Hàm cập nhật tiêu đề
  void _updateTitle(String newTitle) {
    setState(() {
      _currentTitle = newTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.red[50],
        useMaterial3: true,
        fontFamily: 'Times New Roman',
      ),
      home: Homescreen(
        title: _currentTitle,
        onTitleChange: _updateTitle,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
