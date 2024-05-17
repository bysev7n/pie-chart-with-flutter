import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment Pie Chart',
      theme: ThemeData(
        primaryColor: Color(0xFF2F3336),
        scaffoldBackgroundColor: Color(0xFF2F3336),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF2F3336),
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InvestmentPieChartExample(),
    );
  }
}

class InvestmentPieChartExample extends StatefulWidget {
  @override
  _InvestmentPieChartExampleState createState() => _InvestmentPieChartExampleState();
}

class _InvestmentPieChartExampleState extends State<InvestmentPieChartExample> {
  late List<_InvestmentData> data;

  @override
  void initState() {
    super.initState();
    data = [
      _InvestmentData('Stocks', 35),
      _InvestmentData('Bonds', 28),
      _InvestmentData('Real Estate', 20),
      _InvestmentData('Cryptocurrency', 17),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: 300, // Defina a largura fixa aqui
              height: MediaQuery.of(context).size.height / 2,
              child: SfCircularChart(
                title: ChartTitle(
                  text: 'Lorem Ipsum is simply',
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                legend: Legend(
                  isVisible: true,
                  textStyle: TextStyle(color: Colors.white),
                  position: LegendPosition.top,
                  alignment: ChartAlignment.center,
                  orientation: LegendItemOrientation.horizontal,
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  textStyle: TextStyle(color: Colors.black),
                  color: Colors.white,
                ),
                series: <CircularSeries>[
                  PieSeries<_InvestmentData, String>(
                    dataSource: data,
                    xValueMapper: (_InvestmentData investment, _) => investment.label,
                    yValueMapper: (_InvestmentData investment, _) => investment.amount,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    explode: true,
                    explodeIndex: 0,
                    pointColorMapper: (_InvestmentData data, _) {
                      switch (data.label) {
                        case 'Stocks':
                          return Color(0xFF4CAF50);
                        case 'Bonds':
                          return Color(0xFF2196F3);
                        case 'Real Estate':
                          return Color(0xFFFFC107);
                        case 'Cryptocurrency':
                          return Color(0xFFF44336);
                        default:
                          return Colors.grey;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InvestmentData {
  _InvestmentData(this.label, this.amount);

  final String label;
  final double amount;
}
