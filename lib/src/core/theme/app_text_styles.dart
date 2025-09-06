import 'package:flutter/material.dart';

import 'package:applab/src/core/theme/app_colors.dart';

class  AppTextStyles {
  
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
 

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle body1Text = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}