import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  final String note;

  Edit({required this.note});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    final parts = widget.note.split(':');
    final title = parts.isNotEmpty ? parts[0] : '';
    final content = parts.length > 1 ? parts[1] : '';

    _titleController = TextEditingController(text: title);
    _contentController = TextEditingController(text: content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      _showErrorDialog();
    } else {
      final editedNote = '${_titleController.text}:${_contentController.text}';
      Navigator.pop(context, editedNote);
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lỗi'),
          content: Text('Tiêu đề và nội dung không được để trống.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Chỉnh sửa ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 800,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Tiêu đề',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
