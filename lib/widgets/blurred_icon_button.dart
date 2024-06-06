import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';

class BlurredIconButton extends StatelessWidget {
  const BlurredIconButton({super.key, this.onTap, required this.icon});

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 9, right: 11, bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.greySplash,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 15.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
