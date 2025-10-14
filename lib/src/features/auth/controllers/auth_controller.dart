import 'package:applab/src/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? token;
  final String? errorMessage;

  AuthState({
    this.isLoading = false,
    this.token,
    this.errorMessage,
  });

  AuthState copywith({
    bool? isLoading,
    String? token,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthController extends StateNotifier<AuthState>{

  final LoginUseCase  _loginUseCase;

  AuthController(this._loginUseCase) : super(AuthState());

  Future<void> login(String user, String pass) async {
    state = state.copywith(isLoading: true, errorMessage: null);
    try{
      final auth = await _loginUseCase.login(user, pass);

      state = state.copywith(isLoading: false, token: 'SSS');
      
    }catch(e){
      state = state.copywith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    // Implementa la lógica de cierre de sesión aquí
    //state = state.copywith(isAuthenticated: false);
  }



}