
import 'package:applab/src/domain/entities/user.dart';
import 'package:applab/src/domain/usecases/is_authenticated_usecase.dart';

abstract class AuthRepository {
  Future<User> signIn(String username, String password);
  Future<void> logout();
  Future<bool> IsAuthenticated();
}