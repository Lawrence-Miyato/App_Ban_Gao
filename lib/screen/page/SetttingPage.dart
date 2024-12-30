import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Setttingpage extends StatefulWidget {
  const Setttingpage({super.key});

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Cài Đặt"),
      ),
    );
  }
}
