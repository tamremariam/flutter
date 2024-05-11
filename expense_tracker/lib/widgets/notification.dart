import 'package:flutter/material.dart';

class MyFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your fragment UI content here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is my fragment!',
            style: TextStyle(fontSize: 20),
          ),
          TextButton(
            onPressed: () {
              // Do something when button is pressed
            },
            child: Text('Click me'),
          ),
        ],
      ),
    );
  }
}
