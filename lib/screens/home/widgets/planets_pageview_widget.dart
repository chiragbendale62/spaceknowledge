import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/providers/home_provider.dart';
import 'package:spaceknowledge/screens/home/widgets/three_d_globe_widget.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/widgets/blurred_icon_button.dart';

class PlanetsPageViewWidget extends StatelessWidget {
  const PlanetsPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              // pageSnapping: true,
              scrollDirection: Axis.horizontal,

              controller: provider.pageController,
              itemCount: provider.globesList.length,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                provider.onPageChanged(value);
              },
              itemBuilder: (context, index) {
                var globe = provider.globesList[index];
                return ThreeDGlobeWidget(globe: globe);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // previous planet button
                BlurredIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () {
                    provider.pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  },
                ),
                Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        final fadeAnimation = Tween<double>(
                          begin: 0, // Start from the right
                          end: 1, // End at the center
                        ).animate(animation);
                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                      child: Text(
                        provider.globesList[provider.currentIndex].title,
                        key: ValueKey<String>(provider.globesList[provider.currentIndex].title),
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        final fadeAnimation = Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation);
                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                      child: Text(
                        provider.globesList[provider.currentIndex].subtitle,
                        key: ValueKey<String>(provider.globesList[provider.currentIndex].subtitle),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                          height: 1,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                // next planet button
                BlurredIconButton(
                  icon: Icons.arrow_forward_ios_rounded,
                  onTap: () {
                    provider.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
