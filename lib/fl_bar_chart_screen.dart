import 'package:fl_bar_chart_example/data_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatefulWidget {
  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<DataModel> _list = List<DataModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _list.add(DataModel(key: "0", value: "2"));
    _list.add(DataModel(key: "1", value: "4"));
    _list.add(DataModel(key: "2", value: "6"));
    _list.add(DataModel(key: "3", value: "8"));
    _list.add(DataModel(key: "4", value: "10"));
    _list.add(DataModel(key: "5", value: "8"));
    _list.add(DataModel(key: "6", value: "4"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            color: Colors.white,
            height: 100,
            width: 200,
          ),
          flex: 2),
          Expanded(child: Container(
            color: Colors.white,
            height: 100,
            width: 200,
            child: BarChart(
              BarChartData(
                backgroundColor: Colors.white,
                barGroups: _chartGroups(),
                borderData: FlBorderData(
                    border: const Border(bottom: BorderSide(), left: BorderSide())),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      )),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
          flex: 2),
        ],
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    List<BarChartGroupData> list =
        List<BarChartGroupData>.empty(growable: true);
    for (int i = 0; i < _list.length; i++) {
      list.add(BarChartGroupData(x: i, barRods: [
        BarChartRodData(
            toY: double.parse(_list[i].value!), color: Colors.deepOrange)
      ]));
    }
    return list;
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Mon';
              break;
            case 1:
              text = 'Tue';
              break;
            case 2:
              text = 'Wed';
              break;
            case 3:
              text = 'Thu';
              break;
            case 4:
              text = 'Fri';
              break;
            case 5:
              text = 'Sat';
              break;
            case 6:
              text = 'Sun';
              break;
          }

          return Text(
            text,
            style: TextStyle(fontSize: 10),
          );
        },
      );
}
