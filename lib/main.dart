import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/stock_data': (context) => StockDataPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<StockItem> stockItems = [
    StockItem('ICICI Bank', 'assets/icici-bank-vector-logo.png'),
    StockItem('Infosys', 'assets/infosys-logo.jpg'),
    StockItem('Reliance Industries LTD.', 'assets/img.png'),
    StockItem('L&T', 'assets/larsen-and-toubro--600.png'),
    StockItem('Tata Chemical', 'assets/img_1.png'),
    StockItem('Bajaj Auto', 'assets/img_2.png'),
    StockItem('Maruti Suzuki', 'assets/img_3.png'),
    StockItem('Hero MotoCorp.', 'assets/img_4.png'),
    StockItem('Tata Motors', 'assets/img_5.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: ListView.builder(
        itemCount: stockItems.length,
        itemBuilder: (context, index) {
          final stockItem = stockItems[index];
          return Card(
            color: Colors.grey[800],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(stockItem.imagePath),
              ),
              title: Text(
                stockItem.stockName,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/stock_data', arguments: stockItem.stockName);
              },
            ),
          );
        },
      ),
    );
  }
}

class StockItem {
  final String stockName;
  final String imagePath;

  StockItem(this.stockName, this.imagePath);
}
class StockData {
  final String stockName;
  final DateTime date;
  final double value;

  StockData(this.stockName, this.date, this.value);
}

class StockDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String stockName = ModalRoute.of(context)!.settings.arguments as String;

    // Replace this dummy data with your actual stock data
    final List<StockData> stockValues = [

      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 9)), 917.65),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 8)), 922.10),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 7)), 922.85),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 6)), 921.70),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 5)), 926.95),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 4)), 937.90),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 3)), 934.40),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 2)), 936.05),
      StockData('ICICI Bank', DateTime.now().subtract(Duration(days: 1)), 939.30),
      StockData('ICICI Bank', DateTime.now(), 945.85),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 9)), 1252.75),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 8)), 1277.45),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 7)), 1269.15),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 6)), 1273.55),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 5)), 1259.10),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 4)), 1265.60),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 3)), 1270.70),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 2)), 1263.25),
      StockData('Infosys', DateTime.now().subtract(Duration(days: 1)), 1256.10),
      StockData('Infosys', DateTime.now(), 1250.0),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 9)), 2420.50),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 8)), 2441.05),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 7)), 2420.10),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 6)), 2448.0),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 5)), 2441.75),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 4)), 2471.90),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 3)), 2479.55),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 2)), 2496.60),
      StockData('Reliance Industries LTD.', DateTime.now().subtract(Duration(days: 1)), 2480.30),
      StockData('Reliance Industries LTD.', DateTime.now(), 2485.60),
      StockData('L&T', DateTime.now().subtract(Duration(days: 9)), 2364.40),
      StockData('L&T', DateTime.now().subtract(Duration(days: 8)), 2384.45),
      StockData('L&T', DateTime.now().subtract(Duration(days: 7)), 2356.30),
      StockData('L&T', DateTime.now().subtract(Duration(days: 6)), 2356.90),
      StockData('L&T', DateTime.now().subtract(Duration(days: 5)), 2377.50),
      StockData('L&T', DateTime.now().subtract(Duration(days: 4)), 2365.40),
      StockData('L&T', DateTime.now().subtract(Duration(days: 3)), 2374.35),
      StockData('L&T', DateTime.now().subtract(Duration(days: 2)), 2364.45),
      StockData('L&T', DateTime.now().subtract(Duration(days: 1)), 2242.15),
      StockData('L&T', DateTime.now(), 2215.25),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 9)),952.70),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 8)), 972.0),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 7)), 993.10),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 6)), 982.25),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 5)), 959.50),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 4)), 969.95),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 3)), 965.85),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 2)), 974.50),
      StockData('Tata Chemical', DateTime.now().subtract(Duration(days: 1)), 988.60),
      StockData('Tata Chemical', DateTime.now(), 984.55),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 9)), 4431.95),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 8)), 4498.0),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 7)), 4447.85),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 6)), 4457.70),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 5)), 4463.10),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 4)), 4549.25),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 3)), 4528.85),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 2)), 4555.95),
      StockData('Bajaj Auto', DateTime.now().subtract(Duration(days: 1)), 4547.90),
      StockData('Bajaj Auto', DateTime.now(), 4550.0),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 9)), 8589.55),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 8)), 8776.85),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 7)), 8797.30),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 6)), 8800.60),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 5)), 8948.65),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 4)), 9076.25),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 3)), 9111.55),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 2)), 9168.15),
      StockData('Maruti Suzuki', DateTime.now().subtract(Duration(days: 1)), 9260.90),
      StockData('Maruti Suzuki', DateTime.now(), 9308.20),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 9)), 2558.60),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 8)), 2495.90),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 7)), 2502.65),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 6)), 2514.50),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 5)), 2547.25),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 4)), 2576.35),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 3)), 2591.55),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 2)), 2586.05),
      StockData('Hero MotoCorp.', DateTime.now().subtract(Duration(days: 1)), 2585.45),
      StockData('Hero MotoCorp.', DateTime.now(), 2607.80),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 9)), 484.95),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 8)), 480.25),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 7)), 483.70),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 6)), 480.80),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 5)), 477.10),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 4)), 500.50),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 3)), 503.65),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 2)), 509.50),
      StockData('Tata Motors', DateTime.now().subtract(Duration(days: 1)), 511.60),
      StockData('Tata Motors', DateTime.now(), 517.10),

    ];

    List<charts.Series<StockData, DateTime>> seriesList = [];

    final filteredStockValues = stockValues.where((data) => data.stockName == stockName).toList();

    final series = charts.Series<StockData, DateTime>(
      id: 'StockData_$stockName',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (StockData stock, _) => stock.date,
      measureFn: (StockData stock, _) => stock.value,
      data: filteredStockValues,
    );

    seriesList.add(series);

    return Scaffold(
        appBar: AppBar(
          title: Text('Stock Data - $stockName'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'Stock Values for ${stockName}',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.amberAccent,
        letterSpacing: 2.0,
      ),
    ),
      SizedBox(height: 16.0),
      Expanded(
        child: charts.TimeSeriesChart(
          seriesList,
          animate: true,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
        ),
      ),
    ],
    ),
        ),
    );
  }
}
