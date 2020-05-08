import 'package:grpcmobil/common/grpc_commons.dart';
import 'package:grpcmobil/src/generated/user.pb.dart';
import 'package:grpcmobil/src/generated/user.pbgrpc.dart';

class UserService {
  static Future<AddReply> addUser(String username, String password, companyName ) async{
    var client = UserServiceClient(GrpcClientSingleton().client);
    AddRequest request = new AddRequest();
    request.username = username;
    request.password = password;
    request.companyName = companyName;
    return await client.addUser(request);
  }
}