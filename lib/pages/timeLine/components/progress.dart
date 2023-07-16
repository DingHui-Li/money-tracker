import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoneyProgressOfHome extends StatelessWidget {
  const MoneyProgressOfHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '本期（1日~31日，31天）支出',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: LineChart(lineChartData))
              ],
            ),
          ),
        ),
        Container(
          color: Color(0xff00509F).withOpacity(0.5),
          width: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 0.5,
                  child: Container(
                    color: Color(0xff00509F),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '50',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Transform.translate(
                      offset: Offset(2, -12),
                      child: const Text(
                        '%',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  LineChartData get lineChartData => LineChartData(
        lineTouchData: const LineTouchData(handleBuiltInTouches: false),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Color(0xff8C55CB),
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: List.generate(31, (index) => index).map(
              (e) {
                var value = Random().nextDouble() * 100;
                return FlSpot(e.toDouble() + 1, value);
              },
            ).toList(),
          )
        ],
        minX: 0,
        maxX: 31,
        maxY: 100,
        minY: 0,
      );
}
