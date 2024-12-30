import 'package:app_ban_gao/screen/page/HomeScreen.dart';
import 'package:app_ban_gao/screen/shopping/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTitle =
      'Bán Gạo 2024'; // Đặt tiêu đề ban đầu là "Bán Gạo 2024"

  // Hàm cập nhật tiêu đề khi điều hướng
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
        scaffoldBackgroundColor: Colors.blueGrey[100],
        useMaterial3: true,
        fontFamily: 'Times New Roman',
      ),
      // Truyền _updateTitle cho các màn hình con để chúng có thể thay đổi tiêu đề
      home: Homescreen(
        title: _currentTitle,
        onTitleChange: _updateTitle,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
