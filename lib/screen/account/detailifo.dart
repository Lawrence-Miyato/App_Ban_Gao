import 'package:flutter/material.dart';

class Detailifo extends StatelessWidget {
  const Detailifo(
      {super.key,
      required String title,
      required Null Function(dynamic newTitle) onTitleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Trang Thong Tin Tai Khoan'),
      ),
    );
  }
}
