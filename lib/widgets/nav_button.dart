import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NavButton(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
