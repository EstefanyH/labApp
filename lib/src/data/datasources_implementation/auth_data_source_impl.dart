import 'package:applab/src/core/constants/endpoints.dart';
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
    var model = {
      'username': username,
      'password': password
    };

    final response = await dio.post(EndPoints.signIn, data: model);

    if(response.statusCode == 200 || response.statusCode == 201){
      return User.fromJson(response.data);
    } else {
      throw Exception('Login failed: ${response.statusCode}');
    }
  }
}