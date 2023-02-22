import 'package:flutter/material.dart';
import 'package:todo_api/service/todo_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Todo instance = Todo();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class c"),
        backgroundColor: Colors.yellow[600],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FutureBuilder(
          future: instance.getTodo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Map<String, dynamic>> todos = snapshot.data!;
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(
                        title: Text(todo['title'],style: TextStyle(color: Colors.grey, fontSize: 21),),
                        trailing: Checkbox(
                          activeColor: Colors.green[800],
                          side: BorderSide(color: Colors.grey,width: 2),
                          value: todo["completed"],
                          onChanged: (bool? value) {
                            setState(() {
                            todo["completed"] = value;
                            });
                          },
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
