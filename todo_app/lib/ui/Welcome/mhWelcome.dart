import 'package:flutter/material.dart';

class mhWelcome extends StatelessWidget {
  const mhWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: _container(),
      ),
    );
  }
}

Widget _container() {
  return Container(
    child: Column(
      children: [
        _text1(),
        SizedBox(height: 100),
        _text2("Please login to your account or create"),
        _text2("new account to continue")
      ],
    ),
  );
}

Widget _text1() {
  return Container(
    child: const Text(
      "Welcome to Uptodo",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

Widget _text2(String text) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(
        left: 35,
        top: 30,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
