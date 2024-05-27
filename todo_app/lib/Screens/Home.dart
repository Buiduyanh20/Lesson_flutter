import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Add.dart';
import 'package:todo_app/Screens/Edit.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];

  void _addNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Add()),
    );

    if (result != null) {
      setState(() {
        notes.add(result);
      });
    }
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void _editNote(int index) async {
    final editedNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Edit(note: notes[index])),
    );

    if (editedNote != null) {
      setState(() {
        notes[index] = editedNote;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Danh sách ghi chú',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final parts = notes[index].split(':');
          final title = parts.length > 0 ? parts[0] : '';
          final content = parts.length > 1 ? parts[1] : '';

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: ListTile(
              title: Text(
                'Tiêu đề: $title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nội dung : $content'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.cyan),
                    onPressed: () {
                      _editNote(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.cyan),
                    onPressed: () {
                      _deleteNote(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
      //  bottomNavigationBar: BottomnavigationTSD(),
    );
  }
}
