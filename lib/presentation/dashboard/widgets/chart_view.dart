import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadster_admin/presentation/dashboard/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../domain/colors.dart';

class ChartList extends StatelessWidget {
  const ChartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: rectangularRadius(10)),
        child: SfCartesianChart(
            title: ChartTitle(
                text: "Car History :",
                alignment: ChartAlignment.near,
                textStyle: GoogleFonts.roboto(fontSize: 13)),
            primaryXAxis: CategoryAxis(
              isVisible: true,
              axisLine: AxisLine(color: Colors.transparent),
              labelStyle: TextStyle(fontSize: 10),
            ),
            primaryYAxis:
                NumericAxis(minimum: 0, maximum: 600, interval: 100),
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Cars',
                  gradient:const LinearGradient(
                      colors: [chartGradient1, chartGradient2]))
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

final data = [
  _ChartData('BMW', 200),
  _ChartData('MCH', 200),
  _ChartData('TYT', 100),
  _ChartData('BENZ', 80),
  _ChartData('AUDI', 14),
  _ChartData('SWIFT', 14),
  _ChartData('LAMB', 100),
  _ChartData('TES', 14),
];