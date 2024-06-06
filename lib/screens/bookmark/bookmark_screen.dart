import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/widgets/background_widgets.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundStarsWidget(
      childWidget: Scaffold(
        backgroundColor: AppColors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BOOKMARK',
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: 4,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        AppAssets.userImage,
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        'EARTH',
                        style: TextStyle(
                          height: 1,
                          fontSize: 21.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Text(
                        'VIDEO YOU WATCH AND BOOKMARK',
                        style: TextStyle(
                          height: 1,
                          fontSize: 16.sp,
                          color: AppColors.blueLightColor,
                          fontWeight: FontWeight.w300,
                          // height: 1.4,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 10,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 2.h);
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppAssets.earthGlobe,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [
                                        0.2,
                                        0.4,
                                        0.9,
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(0),
                                        Colors.black.withOpacity(0),
                                        Colors.black.withOpacity(0.32),
                                      ], // Gradient for inner shadow
                                    ),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(
                                            color: AppColors.greySplash,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      // SizedBox(height: 3.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
