import 'package:court_click/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeLabelWidget extends StatelessWidget {
  final String text;

  const HomeLabelWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}