import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_isoz/components/todo_item.dart';
import 'login.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';
        return AlertDialog(
          title: Text('Add a new todo'),
          content: Column(children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                description = value;
              },
            )
          ]),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (title.isNotEmpty) {
                  FirebaseFirestore.instance.collection('todos').add({
                    'title': title,
                    'description': description,
                    'completed': false,
                    'userId': FirebaseAuth.instance.currentUser!.uid,
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('todos')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return ListView(
          children: snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return TodoItem(docId: doc.id, data: data);
          }).toList(),
        );
      },
    );
  }
}
