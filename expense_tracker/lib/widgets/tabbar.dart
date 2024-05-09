import 'package:expense_tracker/screen/stat/chartes/chart_Day.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_month.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_week.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_year.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.width*,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(30), topEnd: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TabBar.secondary(
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(text: 'Day'),
                      Tab(text: 'Week'),
                      Tab(text: 'Month'),
                      Tab(text: 'Year'),
                    ],
                  ),
                ),
                Text(
                  "\$ 250",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyChartDay(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyChartWeek(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyChartMonth(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MyChartYear(),
                ),
              ),
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(child: Text('${widget.outerTab}: Overview tab')),
              // ),
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(
              //       child: Text('${widget.outerTab}: Specifications tab')),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class DisplayChart extends StatelessWidget {
  final String title;
  const DisplayChart({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30))),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: MyChartYear(),
            ),
          ),
        ],
      ),
    );
  }
}
