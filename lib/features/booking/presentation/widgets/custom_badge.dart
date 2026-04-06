import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CustomBadge extends StatelessWidget {
  final String text;

  const CustomBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryYellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.primaryYellow, width: 0.5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryYellow,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}