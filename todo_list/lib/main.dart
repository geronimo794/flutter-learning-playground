import 'package:flutter/material.dart';

class Todo {
  final String name;
  bool isDone;

  Todo({required this.name, required this.isDone});
}

typedef TodoCheckCallback = Function(Todo todo);

class TodoListItem extends StatelessWidget {
  // Variabel inside todo list widget
  final Todo todo;
  final TodoCheckCallback onCheck;

  // Constructor
  TodoListItem({required this.todo, required this.onCheck}) : super(key: ObjectKey(todo));

  // Method to change color
  Color _getColor(BuildContext context) {
    return todo.isDone ? Colors.black54 : Theme.of(context).primaryColor;
  }

  // Method to change text style
  TextStyle? _getTextStyle(BuildContext context) {
    if (!todo.isDone) {
      return null;
    } else {
      return const TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCheck(todo);
      },
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          onCheck(todo);
        },
      ),
      title: Text(
        todo.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  const TodoList({required this.todos, super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void _hadleChecked(Todo todo) {
    setState(() {
      for (var i = 0; i < widget.todos.length; i++) {
        if (widget.todos[i].name == todo.name) {
          if (widget.todos[i].isDone) {
            widget.todos[i].isDone = false;
          } else {
            widget.todos[i].isDone = true;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.todos.map((perTodo) {
        return TodoListItem(
          todo: perTodo,
          onCheck: _hadleChecked,
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task'),
        ),
        body: Center(
          child: TodoList(todos: [
            Todo(name: '1', isDone: true),
            Todo(name: '2', isDone: false),
            Todo(name: '2', isDone: false),
            Todo(name: '3', isDone: false),
          ]),
        ),
      ),
    ),
  );
}
