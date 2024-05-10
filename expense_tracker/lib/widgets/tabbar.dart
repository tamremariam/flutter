import 'package:expense_tracker/screen/stat/chartes/chart_Day.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_month.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_week.dart';
import 'package:expense_tracker/screen/stat/chartes/chart_year.dart';
import 'package:expense_tracker/screen/stat/chartes/line_chart_sample1.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TabBar.secondary(
                    tabAlignment: TabAlignment.center,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.black,
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(text: 'Day'),
                      Tab(text: 'Week'),
                      Tab(text: 'Month'),
                      Tab(text: 'Year'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("this is where i select time");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "today",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      Icon(Icons.expand_more,
                          color: Theme.of(context).colorScheme.outline)
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
              // BarChartSample1(),
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

// import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTexts;

  CustomTabBar({required this.tabController, required this.tabTexts});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabTexts.map((text) => Tab(text: text)).toList(),
      indicator: CustomTabIndicator(
        tabController: tabController,
        tabTexts: tabTexts,
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final TabController tabController;
  final List<String> tabTexts;

  CustomTabIndicator({required this.tabController, required this.tabTexts});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(
      tabController: tabController,
      tabTexts: tabTexts,
      onChanged: onChanged,
    );
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final TabController tabController;
  final List<String> tabTexts;

  _CustomTabIndicatorPainter({
    required this.tabController,
    required this.tabTexts,
    VoidCallback? onChanged,
  }) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final List<double> tabWidths = tabTexts.map((text) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text),
        textDirection: TextDirection.ltr,
      )..layout();
      return textPainter.width;
    }).toList();

    final double totalWidth = tabWidths.reduce((a, b) => a + b);
    final double tabWidth = totalWidth / tabWidths.length;

    final double indicatorWidth = tabWidth - 16; // Adjust padding as needed

    final double indicatorPosition =
        tabController.index * tabWidth + (tabWidth - indicatorWidth) / 2;

    final Paint paint = Paint()
      ..color = Colors.blue // Change color as needed
      ..strokeWidth = 4 // Adjust thickness as needed
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      offset.translate(
          offset.dx + indicatorPosition, configuration.size!.height - 4),
      offset.translate(offset.dx + indicatorPosition + indicatorWidth,
          configuration.size!.height - 4),
      paint,
    );
  }
}
