import 'package:applab/src/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;

  AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  AuthState copywith({
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthController extends StateNotifier<AuthState>{

  final LoginUseCase  _loginUseCase;

  AuthController(this._loginUseCase) : super(AuthState()){

  }

  Future<void> login(String user, String pass) async {
    state = state.copywith(isLoading: true, errorMessage: null);
    try{
      final auth = await _loginUseCase.login(user, pass);

      state = state.copywith(isLoading: false, isAuthenticated: true);
      
    }catch(e){
      state = state.copywith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    // Implementa la lógica de cierre de sesión aquí
    state = state.copywith(isAuthenticated: false);
  }



}