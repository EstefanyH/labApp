import 'package:applab/src/core/theme/app_colors.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LabCard extends StatelessWidget {
  final String title;
  final String district;
  final String kilometer;
  final String address;
  final String price;
  final VoidCallback? onTap;

  const LabCard({
    super.key,
    required this.title,
    required this.district,
    required this.kilometer,
    required this.address,
    required this.price,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF7993b9), // Fondo azul claro
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Color de la sombra
            blurRadius: 6, // Difuminado
            offset: Offset(0, 3), // Desplazamiento
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.headline3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text('$district, $kilometer'),
                    Text(address),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/icons/hospital.png', width: 30, height: 30),
                  Text(price, style: AppTextStyles.bodyText),
                ],
              ),
            ],
          ),

          SizedBox(height: 10), 

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                'Ver detalle',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );

  }
}