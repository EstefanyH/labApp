import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String hint;

  const CustomSearchField({
    super.key,
    this.hint = "Buscar...",
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(
        color: Colors.black87, // 🔹 Texto que escribes
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: widget.hint, // ✅ Se muestra dentro del campo, no arriba
        hintStyle: const TextStyle(color: Colors.grey), // 🔹 placeholder en gris
        filled: true,
        fillColor: Colors.grey.shade200, // 🔹 Fondo gris claro
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        // 🔍 Ícono de búsqueda
        prefixIcon: const Icon(Icons.search, color: Colors.grey),

        // ❌ Botón de limpiar
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {}); // Redibuja para mostrar/ocultar la X
      },
    );
  }
}
