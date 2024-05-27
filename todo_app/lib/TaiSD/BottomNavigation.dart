import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Add.dart';
import 'package:todo_app/Screens/Home.dart';

class BottomnavigationTSD extends StatefulWidget {
  const BottomnavigationTSD({super.key});

  @override
  State<BottomnavigationTSD> createState() => _BottomnavigationTSDState();
}

class _BottomnavigationTSDState extends State<BottomnavigationTSD> {
  int _chonIndex = 0;

  final List<Widget> _Screens = [
    NoteListScreen(),
    Add(),
  ];

  void _bam(int index) {
    setState(() {
      _chonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _chonIndex,
        children: _Screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Tooltip(
              message: "Home",
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: "Add task",
              child: Icon(Icons.add),
            ),
            label: 'Add task',
          ),
        ],
        currentIndex: _chonIndex,
        onTap: _bam,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
