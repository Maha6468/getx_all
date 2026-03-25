
import 'package:flutter/material.dart';
import 'package:getx_all/Provider/provider_class.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Maha");
    final provider = context.watch<CounterProvider>();

    return Scaffold(

      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // 🔥 উপরে রাখবে
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 10), // 👈 একটু gap (optional)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ➖ Decrement Button
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().decrement();
                  print("majala");
                },
                child: Icon(Icons.remove),
              ),

              SizedBox(width: 20),

              // 🔢 Counter Text
              Text(
                provider.count.toString(),
                style: TextStyle(fontSize: 40),
              ),

              SizedBox(width: 20),

              // ➕ Increment Button
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().increment();
                  print("Rahman");
                },
                child: Icon(Icons.add),
              ),



            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.history.length,
              itemBuilder: (context, index) {
                final reversedIndex =
                    provider.history.length - 1 - index;

                return Center(
                  child: Text(
                    "Last Update: ${provider.history[reversedIndex].toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().clearAll();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("Clear"),
          ),
          SizedBox(height: 30,)

        ],
      ),
    );
  }
}
