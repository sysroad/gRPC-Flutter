///
//  Generated code. Do not modify.
//  source: randomPoints.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Point extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Point', package: const $pb.PackageName('charting'), createEmptyInstance: create)
    ..a<$core.int>(1, 'x', $pb.PbFieldType.O3)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Point._() : super();
  factory Point() => create();
  factory Point.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Point.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Point clone() => Point()..mergeFromMessage(this);
  Point copyWith(void Function(Point) updates) => super.copyWith((message) => updates(message as Point));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Point create() => Point._();
  Point createEmptyInstance() => create();
  static $pb.PbList<Point> createRepeated() => $pb.PbList<Point>();
  @$core.pragma('dart2js:noInline')
  static Point getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Point>(create);
  static Point _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class PointsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PointsRequest', package: const $pb.PackageName('charting'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PointsRequest._() : super();
  factory PointsRequest() => create();
  factory PointsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PointsRequest clone() => PointsRequest()..mergeFromMessage(this);
  PointsRequest copyWith(void Function(PointsRequest) updates) => super.copyWith((message) => updates(message as PointsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointsRequest create() => PointsRequest._();
  PointsRequest createEmptyInstance() => create();
  static $pb.PbList<PointsRequest> createRepeated() => $pb.PbList<PointsRequest>();
  @$core.pragma('dart2js:noInline')
  static PointsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointsRequest>(create);
  static PointsRequest _defaultInstance;
}

class PointsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PointsReply', package: const $pb.PackageName('charting'), createEmptyInstance: create)
    ..pc<Point>(1, 'points', $pb.PbFieldType.PM, subBuilder: Point.create)
    ..hasRequiredFields = false
  ;

  PointsReply._() : super();
  factory PointsReply() => create();
  factory PointsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PointsReply clone() => PointsReply()..mergeFromMessage(this);
  PointsReply copyWith(void Function(PointsReply) updates) => super.copyWith((message) => updates(message as PointsReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointsReply create() => PointsReply._();
  PointsReply createEmptyInstance() => create();
  static $pb.PbList<PointsReply> createRepeated() => $pb.PbList<PointsReply>();
  @$core.pragma('dart2js:noInline')
  static PointsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointsReply>(create);
  static PointsReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Point> get points => $_getList(0);
}

