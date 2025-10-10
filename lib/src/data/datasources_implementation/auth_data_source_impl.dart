import 'package:applab/src/core/constants/endpoints.dart';
import 'package:applab/src/core/utils/response_handler.dart';
import 'package:applab/src/data/datasources/auth_data_source.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/user.dart';


class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;
  
  AuthDataSourceImpl(this.dio);

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signIn(String username, String password) async {
    // TODO: implement signIn
    //
    try{
      var model = {
        'username': username,
        'password': password
      };

      final response = await dio.post(EndPoints.signIn, data: model);
      final result = ResponseHandler.handleResponse<User>
        (response: response, fromJson: (json)=> User.fromJson(json));

        if(result.success && result.data != null){
          return result.data!;
        } else {
          throw Exception(result.message ?? 'Login failed');
        }
    } catch(ex){
      throw ResponseHandler.handleError(ex);
    }
  }
}