import 'package:flutter/material.dart';

class mhIntro extends StatelessWidget {
  const mhIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: _buildBodyPage(),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImg(),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildImg() {
    return Image.asset(
      "assets/images/anh.png",
      width: 95,
      height: 80,
      fit: BoxFit.contain,
    );
  }

  Widget _buildText() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        "UpTodo",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
