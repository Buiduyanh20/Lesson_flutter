import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  Add({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void _saveNoteAndPop(BuildContext context) {
    String title = titleController.text;
    String content = contentController.text;

    if (title.isEmpty || content.isEmpty) {
      _showErrorDialog(context);
    } else {
      Navigator.pop(context, '$title: $content');
    }
  }

  void _showErrorDialog(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () => _saveNoteAndPop(context),
            icon: Icon(Icons.save),
          ),
        ],
        title: const Text(
          'Thêm danh sách ghi chú',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 800,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar: BottomnavigationTSD(),
    );
  }
}
