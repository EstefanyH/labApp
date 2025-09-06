import 'package:flutter/material.dart';

class FeatureSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const FeatureSlide({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔹 Imagen más pequeña
        Image.asset(image, width: 120, height: 120, fit: BoxFit.contain),
        const SizedBox(height: 12),

        // 🔹 Título
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18, // 👈 un poco más pequeño
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 6),

        // 🔹 Descripción
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14, // 👈 más pequeño
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
