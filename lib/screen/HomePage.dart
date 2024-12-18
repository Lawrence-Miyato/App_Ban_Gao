import 'package:app_ban_gao/screen/CarouselPromotion.dart';
import 'package:app_ban_gao/screen/CarouselPropose.dart';
import 'package:app_ban_gao/screen/index.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.pink[50],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Đề Xuất',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Carouselpropose(),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Khuyến Mãi',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Carouselpromotion(),
          const SizedBox(
            height: 20,
          ),
          Index(),
        ],
      ),
    );
  }
}
