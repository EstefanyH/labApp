
import 'package:applab/src/core/constants/endpoints.dart';
import 'package:applab/src/data/datasources/auth_data_source.dart';
import 'package:applab/src/data/datasources_implementation/auth_data_source_impl.dart';
import 'package:applab/src/data/repositories_impl/auth_repository_impl.dart';
import 'package:applab/src/domain/repositories/auth_repositories.dart';
import 'package:applab/src/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controllers/auth_controller.dart'; 

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  dio.interceptors.add(LogInterceptor());
  return dio;
});

final authDataSource = Provider<AuthDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthDataSourceImpl(dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref){
  return AuthRepositoryImpl(ref.watch(authDataSource));
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref){
  return AuthController(ref.watch(loginUseCaseProvider));
});
