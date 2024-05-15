import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/counter_provider.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterModel>(
        builder: (context, model, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.numbercounter
                    .toString()), // Access the count property from CounterModel
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterModel>().increment();
            },
            tooltip: 'Increment',
            heroTag: "sampleincrement",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
