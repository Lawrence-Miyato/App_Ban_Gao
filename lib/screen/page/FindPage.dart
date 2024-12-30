import 'package:flutter/material.dart';

class Findpage extends StatelessWidget {
  const Findpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm Kiếm'),
      ),
      body: Container(
        child: Center(
          child: Text('Trang Tìm Kiếm'),
        ),
      ),
    );
  }
}
