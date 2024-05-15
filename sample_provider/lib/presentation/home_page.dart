import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/presentation/samplepage.dart';
import 'package:sample_provider/provider/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  // final String title;

  // int _counter = 0;

  // void _incrementCounter() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Provide home page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            Text(
              context.watch<CounterModel>().numbercounter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SamplePage()),
                  );
                },
                child: Text("Next page"))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterModel>().increment();
            },
            tooltip: 'Increment',
            heroTag: "homeincrement",
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterModel>().decrement();
            },
            heroTag: "homedecrement",
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
