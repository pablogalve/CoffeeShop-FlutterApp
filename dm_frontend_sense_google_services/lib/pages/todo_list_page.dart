import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dm_frontend/model.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildError(error) {
    return Scaffold(
      body: Center(
        child: Text(
          error.toString(),
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _removeAllCheckedItems(List<Item> docs) {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    final todos = FirebaseFirestore.instance.collection('todos');
    for (var doc in docs) {
      if (doc.done) {
        batch.delete(todos.doc(doc.id));
      }
    }
    batch.commit();
  } 

  Widget _buildTodoList(List<Item> docs) {
    final todos = FirebaseFirestore.instance.collection('todos');
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List Firebase'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _removeAllCheckedItems(docs);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final item = docs[index];
                return ListTile(
                  title: Text(
                    item.what,
                    style: TextStyle(
                      decoration: item.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: item.done,
                    onChanged: (newValue) {
                      // Actualitzar Firestore per posar el nou valor de 'done'
                      todos.doc(item.id).update({'done': newValue});
                    },
                  ),
                  onTap: () {
                    todos.doc(item.id).update({'done': !item.done});
                  },
                  onLongPress: () {
                    todos.doc(item.id).delete();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item "${item.what}" deleted'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            todos.add(item.toFirestore());
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Material(
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      todos.add({
                        'what': _controller.text,
                        'done': false,
                        'date': DateTime.now(),
                      });
                      _controller.clear();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: todoListSnapshots(),
      builder: (context, AsyncSnapshot<List<Item>> snapshot) {
        if (snapshot.hasError) {
          return _buildError(snapshot.error);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoading();
          case ConnectionState.active:
            return _buildTodoList(snapshot.data);
          default: // ConnectionState.none || ConnectionState.done
            return _buildError("Unreachable (done or none)");
        }
      },
    );
  }
}
