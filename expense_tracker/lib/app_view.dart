import 'package:expense_tracker/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "expemce tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade100,
            onBackground: Colors.black,
            primary: const Color(0xFF00B2E7),
            secondary: const Color(0xFFE064F7),
            tertiary: const Color(0xFFFF8D6C),
            outline: Colors.grey),
      ),
      home: const HomeScreen(),
    );
  }
}
