import 'package:flutter/material.dart';
import 'loading_dots.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child, // Pantalla debajo

        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Fondo semitransparente
              child: const Center(
                child: LoadingDots(
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                  size: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
