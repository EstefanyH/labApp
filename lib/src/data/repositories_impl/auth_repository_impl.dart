import 'package:applab/src/data/datasources/auth_data_source.dart';
import 'package:applab/src/domain/entities/user.dart';
import 'package:applab/src/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<bool> IsAuthenticated() {
    // TODO: implement IsAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signIn(String username, String password) async {
    // TODO: implement signIn
    try{
      final model =  await dataSource.signIn(username, password);
      return model;
    }catch(e){
      throw Exception('Login failed: $e');
    }
  }
  
}