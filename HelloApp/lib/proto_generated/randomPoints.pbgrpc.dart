///
//  Generated code. Do not modify.
//  source: randomPoints.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'randomPoints.pb.dart' as $1;
export 'randomPoints.pb.dart';

class ChartDataClient extends $grpc.Client {
  static final _$sampleData =
      $grpc.ClientMethod<$1.PointsRequest, $1.PointsReply>(
          '/charting.ChartData/SampleData',
          ($1.PointsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.PointsReply.fromBuffer(value));

  ChartDataClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.PointsReply> sampleData($1.PointsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sampleData, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ChartDataServiceBase extends $grpc.Service {
  $core.String get $name => 'charting.ChartData';

  ChartDataServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.PointsRequest, $1.PointsReply>(
        'SampleData',
        sampleData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PointsRequest.fromBuffer(value),
        ($1.PointsReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.PointsReply> sampleData_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PointsRequest> request) async {
    return sampleData(call, await request);
  }

  $async.Future<$1.PointsReply> sampleData(
      $grpc.ServiceCall call, $1.PointsRequest request);
}
