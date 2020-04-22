import 'package:flutter/material.dart';
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
  String greetText = '';
  List<Point> points;

  _MyHomePageState() {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    GreeterClient(channel)
        .sayHello(HelloRequest()..name = '우분투')
        .then((value) => {
              setState(() {
                greetText = value.message;
              })
            });

    ChartDataClient(channel)
        .sampleData(PointsRequest())
        .then((value) => setState(() {
              points = value.points;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          greetText,
          style: TextStyle(
              fontFamily: 'NanumGothic',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
      ),
    );
  }
}
