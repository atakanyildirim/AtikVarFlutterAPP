///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddRequest', package: const $pb.PackageName('user'), createEmptyInstance: create)
    ..aOS(1, 'companyName')
    ..aOS(2, 'username')
    ..aOS(3, 'password')
    ..hasRequiredFields = false
  ;

  AddRequest._() : super();
  factory AddRequest() => create();
  factory AddRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddRequest clone() => AddRequest()..mergeFromMessage(this);
  AddRequest copyWith(void Function(AddRequest) updates) => super.copyWith((message) => updates(message as AddRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddRequest create() => AddRequest._();
  AddRequest createEmptyInstance() => create();
  static $pb.PbList<AddRequest> createRepeated() => $pb.PbList<AddRequest>();
  @$core.pragma('dart2js:noInline')
  static AddRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddRequest>(create);
  static AddRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get companyName => $_getSZ(0);
  @$pb.TagNumber(1)
  set companyName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompanyName() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanyName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class AddReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddReply', package: const $pb.PackageName('user'), createEmptyInstance: create)
    ..aOB(1, 'isAdded', protoName: 'isAdded')
    ..hasRequiredFields = false
  ;

  AddReply._() : super();
  factory AddReply() => create();
  factory AddReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddReply clone() => AddReply()..mergeFromMessage(this);
  AddReply copyWith(void Function(AddReply) updates) => super.copyWith((message) => updates(message as AddReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddReply create() => AddReply._();
  AddReply createEmptyInstance() => create();
  static $pb.PbList<AddReply> createRepeated() => $pb.PbList<AddReply>();
  @$core.pragma('dart2js:noInline')
  static AddReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddReply>(create);
  static AddReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAdded => $_getBF(0);
  @$pb.TagNumber(1)
  set isAdded($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAdded() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAdded() => clearField(1);
}

