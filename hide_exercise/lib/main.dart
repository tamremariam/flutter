import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  var friends = await Hive.openBox('friends');
  friends.clear();

  friends.add('Lisa'); // index 0, key 0
  friends.add('Dave'); // index 1, key 1
  friends.put(123, 'Marco'); // index 2, key 123
  friends.add('Paul'); // index 3, key 124

  print(friends.getAt(0));
  // print(friends.get(0));

  print(friends.getAt(1));
  // print(friends.get(1));

  // print(friends.getAt(2));
  print(friends.get(123));

  // print(friends.getAt(3));
  print(friends.get(124));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Settings',
      home: Scaffold(
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('settings').listenable(),
          builder: (context, box, widget) {
            return Center(
              child: Column(
                children: [
                  Switch(
                    value: box.get('darkMode', defaultValue: false),
                    onChanged: (val) {
                      box.put('darkMode', val);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
