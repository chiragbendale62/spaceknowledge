import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/providers/home_provider.dart';
import 'package:spaceknowledge/screens/planet_info/planet_info_screen.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/transitions.dart';

class BlurButton extends StatelessWidget {
  const BlurButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          pageTransition(
            PlanetInfoScreen(globe: provider.globesList[provider.currentIndex]),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0), // Adjust as needed
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.065),
            ),
            child: Center(
              child: Text(
                'Explore planet',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  // height: 1.4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
