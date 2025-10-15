import 'package:applab/src/core/providers/providers.dart';
import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:applab/src/shared/app_background.dart';
import 'package:applab/src/shared/auth_buttons.dart';
import 'package:applab/src/shared/customTextField.dart';
import 'package:applab/src/shared/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final passwordVisibleProvider = StateProvider<bool>((ref) => false);
class LoginPage extends ConsumerStatefulWidget{
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isPasswordVisible = ref.watch(passwordVisibleProvider);
    final _userController = TextEditingController();
    final _passController = TextEditingController();

    ref.listen(authControllerProvider, (prev, next){
      if (next.token != null && prev?.token == null) {
        context.push(AppRouter.search);
      }
      if (next.errorMessage != null && prev?.errorMessage != next.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    return LoadingOverlay(
      //body: AppBackground(
        isLoading: authState.isLoading,
        child: Scaffold(
          body: AppBackground(
            child: SafeArea(
            child:  Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Column(
                children: [
                  
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset('assets/images/logo.png', width: 50, height: 50),
                          SizedBox(height: 10,),
                          Text('¡Hola! Tu salud te espera.', style: AppTextStyles.headline2),
                          const SizedBox(height: 30),

                          CustomTextField(
                            controller: _userController,
                            label: "Usuario",
                            hint: "Usuario",
                            suffixIcon: Icons.person, // 👤 ícono derecha
                          ),
                          const SizedBox(height: 16),

                          CustomTextField(
                            controller: _passController,
                            label: "Contraseña",
                            hint: "Contraseña",
                            suffixIcon: isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off, // 👁 dinámico
                            obscureText: !isPasswordVisible,
                          ),
                        ],
                      ),
                    ),),
                  ),

                  // 🔹 Parte inferior (botones + link)
                  Column(
                    children: [
                      AuthButtons(
                          onLogin: authState.isLoading
                              ? (){} 
                              : () {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .login(_userController.text,
                                          _passController.text);
                                },
                          onRegister: () {
                            //context.push(AppRouter.register);
                          },
                        ),
                      const SizedBox(height: 12),
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: AppTextStyles.body1Text,
                      ),
                    ],
                  ),
                ],
              ),),
          ),),
        )
      );
  }
}
