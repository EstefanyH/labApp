import 'package:applab/src/core/theme/app_colors.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:applab/src/shared/app_background.dart';
import 'package:applab/src/shared/auth_buttons.dart';
import 'package:applab/src/shared/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordVisibleProvider = StateProvider<bool>((ref) => false);

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibleProvider);

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
            child:  Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Column(
                children: [
                  // 🔹 Parte superior (contenido centrado)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('¡Hola de nuevo!', style: AppTextStyles.headline2),
                          const SizedBox(height: 30),

                          CustomTextField(
                            label: "Usuario",
                            hint: "Usuario",
                            suffixIcon: Icons.person, // 👤 ícono derecha
                          ),
                          const SizedBox(height: 16),

                          CustomTextField(
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
                        onLogin: () {
                          //context.push(AppRouter.login);
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
          ),// 👉 aquí va tu contenido
      ),
      
    );
  }
}
