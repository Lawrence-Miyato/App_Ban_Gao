import 'package:flutter/material.dart';

class Paypage extends StatefulWidget {
  const Paypage({super.key});

  @override
  State<Paypage> createState() => _PaypageState();
}

class _PaypageState extends State<Paypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
      ),
    );
  }
}
