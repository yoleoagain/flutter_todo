import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String docId;
  final Map<String, dynamic> data;

  const TodoItem({Key? key, required this.docId, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data['title']),
      onTap: () => _showEditTodoDialog(context, docId, data),
      leading: Checkbox(
        value: data['completed'],
        onChanged: (bool? value) {
          FirebaseFirestore.instance
              .collection('todos')
              .doc(docId)
              .update({'completed': value});
        },
      ),
    );
  }

  void _showEditTodoDialog(
      BuildContext context, String docId, Map<String, dynamic> data) {
    final titleController = TextEditingController(text: data['title']);
    final descriptionController =
        TextEditingController(text: data['description']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('todos')
                    .doc(docId)
                    .update({
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
