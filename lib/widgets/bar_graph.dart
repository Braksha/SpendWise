import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
  import 'package:spendwise/widgets/bar_data.dart';


class MyGraph extends StatelessWidget {
  final List weeklySummaryExpense;
  final List weeklySummaryIncom;

  MyGraph({
    required this.weeklySummaryExpense,
    required this.weeklySummaryIncom,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      SunAmount: weeklySummaryExpense[0],
      ManAmount: weeklySummaryExpense[1],
      TusAmount: weeklySummaryExpense[2],
      WedAmount: weeklySummaryExpense[3],
      TarsAmount: weeklySummaryExpense[4],
      FriAmount: weeklySummaryExpense[5],
      SatAmount: weeklySummaryExpense[6],
    );
    myBarData.initialzeData();

    BarData MyIncom = BarData(
      SunAmount: weeklySummaryIncom[0],
      ManAmount: weeklySummaryIncom[1],
      TusAmount: weeklySummaryIncom[2],
      WedAmount: weeklySummaryIncom[3],
      TarsAmount: weeklySummaryIncom[4],
      FriAmount: weeklySummaryIncom[5],
      SatAmount: weeklySummaryIncom[6],
    );
    MyIncom.initialzeData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        barGroups: [
          ...myBarData.barData.map(
                (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.green,
                  width: 10,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            ),
          ),
          ...MyIncom.barData.map(
                (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.pink,
                  width: 10,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 1:
        text = const Text('M', style: style);
        break;
      case 2:
        text = const Text('T', style: style);
        break;
      case 3:
        text = const Text('W', style: style);
        break;
      case 4:
        text = const Text('T', style: style);
        break;
      case 5:
        text = const Text('F', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text(' ', style: style);
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
