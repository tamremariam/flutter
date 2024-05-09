import 'dart:math';

import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/widgets/IncomeOutcome.dart';
import 'package:expense_tracker/widgets/transactionTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10, 15, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(251, 192, 45, 1),
                          ),
                        ),
                        Icon(
                          CupertinoIcons.person_fill,
                          color: Theme.of(context).colorScheme.outline,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "welcome",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                        Text(
                          "Tamre",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.settings))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4,
                      color: Color.fromRGBO(189, 189, 189, 1),
                      offset: Offset(5, 5))
                ],
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ], transform: const GradientRotation(pi / 4)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total expence",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("\$ 4000",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeOutcome(transactionType: "income", amount: 3000),
                        IncomeOutcome(transactionType: "expence", amount: 2000),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const transactionTitle(
                firsTitle: "transaction", secondTitle: "View All"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: transactionsData.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: transactionsData[i]
                                                ['color']),
                                      ),
                                      Icon(Icons.home)
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    transactionsData[i]['name'],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    transactionsData[i]['totalAmount'],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  // const SizedBox(
                                  //   height: 4,
                                  // ),
                                  Text(
                                    transactionsData[i]['date'],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
