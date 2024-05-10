import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChartMonth extends StatefulWidget {
  const MyChartMonth({super.key});

  @override
  State<MyChartMonth> createState() => _MyChartState();
}

class _MyChartState extends State<MyChartMonth> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            transform: const GradientRotation(pi / 40),
          ),
          width: 5,
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 5, color: Colors.grey.shade300))
    ]);
  }

  List<BarChartGroupData> showingGroups() => List.generate(30, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 2);
          case 8:
            return makeGroupData(1, 3);
          case 9:
            return makeGroupData(2, 2);
          case 10:
            return makeGroupData(3, 4.5);
          case 11:
            return makeGroupData(4, 3.8);
          case 12:
            return makeGroupData(5, 1.5);
          case 13:
            return makeGroupData(6, 4);
          case 14:
            return makeGroupData(0, 2);
          case 15:
            return makeGroupData(1, 3);
          case 16:
            return makeGroupData(2, 2);
          case 17:
            return makeGroupData(3, 4.5);
          case 18:
            return makeGroupData(4, 3.8);
          case 19:
            return makeGroupData(5, 1.5);
          case 20:
            return makeGroupData(6, 4);
          case 21:
            return makeGroupData(0, 2);
          case 22:
            return makeGroupData(1, 3);
          case 23:
            return makeGroupData(2, 2);
          case 24:
            return makeGroupData(3, 4.5);
          case 25:
            return makeGroupData(4, 3.8);
          case 26:
            return makeGroupData(5, 1.5);
          case 27:
            return makeGroupData(6, 4);
          case 28:
            return makeGroupData(0, 2);
          case 29:
            return makeGroupData(1, 3);
          case 30:
            return makeGroupData(2, 2);
          case 31:
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          getTitlesWidget: getTiles,
        )),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('1', style: style);
        break;
      case 1:
        text = const Text('2', style: style);
        break;
      case 2:
        text = const Text('3', style: style);
        break;
      case 3:
        text = const Text('4', style: style);
        break;
      case 4:
        text = const Text('5', style: style);
        break;
      case 5:
        text = const Text('6', style: style);
        break;
      case 6:
        text = const Text('7', style: style);
        break;
      case 7:
        text = const Text('8', style: style);
        break;
      case 8:
        text = const Text('9', style: style);
        break;
      case 9:
        text = const Text('10', style: style);
        break;
      case 10:
        text = const Text('11', style: style);
        break;
      case 11:
        text = const Text('12', style: style);
        break;
      case 12:
        text = const Text('13', style: style);
        break;
      case 13:
        text = const Text('14', style: style);
        break;
      case 14:
        text = const Text('15', style: style);
        break;
      case 15:
        text = const Text('16', style: style);
        break;
      case 16:
        text = const Text('17', style: style);
        break;
      case 17:
        text = const Text('18', style: style);
        break;
      case 18:
        text = const Text('19', style: style);
        break;
      case 19:
        text = const Text('20', style: style);
        break;
      case 20:
        text = const Text('21', style: style);
        break;
      case 21:
        text = const Text('22', style: style);
        break;
      case 22:
        text = const Text('23', style: style);
        break;
      case 23:
        text = const Text('24', style: style);
        break;
      case 24:
        text = const Text('25', style: style);
        break;
      case 25:
        text = const Text('26', style: style);
        break;
      case 26:
        text = const Text('27', style: style);
        break;
      case 27:
        text = const Text('28', style: style);
        break;
      case 28:
        text = const Text('29', style: style);
        break;
      case 29:
        text = const Text('30', style: style);
        break;
      case 30:
        text = const Text('31', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 2) {
      text = '2K';
    } else if (value == 3) {
      text = '3K';
    } else if (value == 4) {
      text = '4K';
    } else if (value == 5) {
      text = '5K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
}
