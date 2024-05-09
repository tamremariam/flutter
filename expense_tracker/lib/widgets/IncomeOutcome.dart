import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomeOutcome extends StatelessWidget {
  final String transactionType;
  final double amount;

  const IncomeOutcome({
    super.key,
    required this.transactionType,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.white30, shape: BoxShape.circle),
            ),
            if (transactionType == "expence")
              const Icon(
                CupertinoIcons.arrow_up,
                size: 12,
                color: Colors.red,
              ),
            if (transactionType == "income")
              const Icon(
                CupertinoIcons.arrow_down,
                size: 12,
                color: Colors.green,
              )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              transactionType,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Text(
              amount.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
