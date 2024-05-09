import 'package:flutter/material.dart';

class transactionTitle extends StatelessWidget {
  final String firsTitle;
  final String secondTitle;
  const transactionTitle({
    super.key,
    required this.firsTitle,
    required this.secondTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firsTitle,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            showAboutDialog(context: context);
          },
          child: Text(
            secondTitle,
            style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
