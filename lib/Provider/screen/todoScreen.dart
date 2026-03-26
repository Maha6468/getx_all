import 'package:flutter/material.dart';
import 'package:getx_all/Provider/changeNotifier/todoProvider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [

          SizedBox(height: 10),

          // 🔹 Input Field + Add Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<TodoProvider>().addTask(controller.text);
                    controller.clear();
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),

          SizedBox(height: 10),

          // 🔹 Task List
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                if (provider.tasks.isEmpty) {
                  return Center(
                    child: Text(
                      "No Tasks Yet",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text(provider.tasks[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context
                                .read<TodoProvider>()
                                .removeTask(index);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // 🔹 Clear All Button
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().clearAll();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Clear All"),
            ),
          ),
        ],
      ),
    );
  }
}