import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/screens/home/widgets/blur_button.dart';
import 'package:spaceknowledge/screens/home/widgets/planets_pageview_widget.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/app_string.dart';
import 'package:spaceknowledge/widgets/background_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundStarsWidget(
      childWidget: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
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
                          'SPACED',
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
                    SizedBox(height: 2.4.h),
                    Text(
                      'Hi Sarah,',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.blueLightColor,
                        fontFamily: AppString.gorditaFontFamily,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Text(
                      'Which planet \nwould you like to explore?',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        // height: 1.4,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    const PlanetsPageViewWidget(),
                    SizedBox(height: 2.5.h),
                    const BlurButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
