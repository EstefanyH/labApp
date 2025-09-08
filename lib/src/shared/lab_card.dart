import 'package:applab/src/core/theme/app_colors.dart';
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
    return Card(
      
      child: ListTile(
        leading: const Icon(Icons.medical_information, color: AppColors.primary),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(district,
                style: const TextStyle(fontSize: 14, color: Colors.black87)),
            const SizedBox(height: 4),
            Text(
              address,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onTap: onTap,
      ),
    ); 
  }
}