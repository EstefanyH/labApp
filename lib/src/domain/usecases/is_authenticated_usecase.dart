import 'package:applab/src/domain/repositories/auth_repositories.dart';

class IsAuthenticatedUseCase {
  final AuthRepository repository;

  IsAuthenticatedUseCase(this.repository);

  Future<bool> execute() async {
    return await repository.IsAuthenticated();
  }
}