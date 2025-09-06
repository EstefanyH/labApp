import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/core/theme/app_colors.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:applab/src/shared/auth_buttons.dart';
import 'package:applab/src/shared/feature_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF003579),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Logo + título
            Image.asset('assets/images/logo.png', width: 100, height: 100),
            const SizedBox(height: 16),
            Text(
              'Tu salud al alcance de un toque',
              textAlign: TextAlign.center,
              style: AppTextStyles.body1Text.copyWith(color: AppColors.white),
            ),

            const SizedBox(height: 30),

            // Carrusel (ajustado)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: PageView(
                children: const [
                  FeatureSlide(
                    image: 'assets/icons/consulta.png',
                    title: 'Consulta tus exámenes',
                    description: 'Accede a tus resultados médicos en cualquier momento y lugar.',
                  ),
                  FeatureSlide(
                    image: 'assets/images/logo.png',
                    title: 'Compara precios de medicinas',
                    description: 'Encuentra la mejor opción de farmacias cercanas y ahorra dinero.',
                  ),
                  FeatureSlide(
                    image: 'assets/icons/hospital.png',
                    title: 'Encuentra hospitales cercanos',
                    description: 'Localiza fácilmente centros de salud disponibles en tu zona.',
                  ),
                ],
              ),
            ),

            const Spacer(), // 👈 empuja los botones al pie

            // Botones
            AuthButtons(
              onLogin: () {
                // aquí navegas a login
                context.push(AppRouter.login);
              },
              onRegister: () {
                // aquí navegas a registro
              },
            ),
          ],
        ),
      ),

    );
  }
}