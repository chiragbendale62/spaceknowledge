import 'package:flutter/material.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';

class BackgroundStarsWidget extends StatelessWidget {
  const BackgroundStarsWidget({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.spaceBGImage,
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            AppColors.black.withOpacity(0.28),
            BlendMode.colorBurn,
          ),
        ),
      ),
      child: childWidget,
    );
  }
}
