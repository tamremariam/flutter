import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/screen/home/widgets/transactionTitle.dart';
import 'package:expense_tracker/screen/stat/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

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
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      )
                      // const Icon(
                      //   Icons.arrow_back,
                      //   color: Colors.white,
                      // )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.settings))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.width*,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    topEnd: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30))),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: MyChart(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const transactionTitle(
              firsTitle: "Sat, 20 May 2024", secondTitle: "View All"),
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
                                          color: transactionsData[i]['color']),
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
    ));
  }
}
