import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:grpc/grpc.dart';
import 'package:HelloApp/proto_generated/greeter.pb.dart';
import 'package:HelloApp/proto_generated/greeter.pbgrpc.dart';
import 'package:HelloApp/proto_generated/randomPoints.pb.dart';
import 'package:HelloApp/proto_generated/randomPoints.pbgrpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    GreeterClient(channel)
        .sayHello(HelloRequest()..name = '차트 플롯 테스트')
        .then((reply) => {
              setState(() {
                titleText = reply.message;
              })
            });
    ChartDataClient(channel).sampleData(PointsRequest()).then((reply) => {
          setState(() {
            samples = reply.points;
          })
        });
  }

  String titleText = '';
  List<Point> samples = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Text(
              titleText,
              style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          Expanded(
            child: charts.LineChart(
              List<charts.Series<Point, int>>()
                ..add(
                  charts.Series<Point, int>(
                    data: samples,
                    id: 'Sample Chart',
                    domainFn: (Point p, _) => p.x,
                    measureFn: (Point p, _) => p.y,
                  ),
                ),
              animate: false,
            ),
          ),
        ],
      ),
    );
  }
}
