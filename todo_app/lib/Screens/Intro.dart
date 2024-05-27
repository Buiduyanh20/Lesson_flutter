import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Home.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ứng dụng TodoList',
                style: TextStyle(fontSize: 25, color: Colors.cyan),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoteListScreen()),
                    );
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
