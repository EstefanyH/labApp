
import 'package:applab/src/domain/entities/user.dart';

abstract class AuthDataSource {
  Future<User> signIn(String username, String password);
  Future<void> logout();
}