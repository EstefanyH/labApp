import 'package:applab/src/core/providers/providers.dart';
import 'package:applab/src/domain/repositories/auth_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);
  
  Future<void> login(String user, String pass) {
    return repository.signIn(user, pass);
  }
}

final loginUseCaseProvider = Provider<LoginUseCase>((ref){
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});