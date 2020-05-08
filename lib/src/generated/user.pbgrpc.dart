///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $0;
export 'user.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$addUser = $grpc.ClientMethod<$0.AddRequest, $0.AddReply>(
      '/user.UserService/addUser',
      ($0.AddRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddReply.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AddReply> addUser($0.AddRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddRequest, $0.AddReply>(
        'addUser',
        addUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddRequest.fromBuffer(value),
        ($0.AddReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddReply> addUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddRequest> request) async {
    return addUser(call, await request);
  }

  $async.Future<$0.AddReply> addUser(
      $grpc.ServiceCall call, $0.AddRequest request);
}
