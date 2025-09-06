import 'package:flutter/material.dart';
import 'package:applab/src/core/theme/app_colors.dart';

class AuthButtons extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  const AuthButtons({
    super.key,
    required this.onLogin,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // 🔹 Botón Login
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Iniciar Sesión"),
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Botón Registro
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onRegister,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.white),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Regístrate"),
            ),
          ),
        ],
      ),
    );
  }
}
