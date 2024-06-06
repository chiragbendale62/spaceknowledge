import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/app_extensions.dart';
import 'package:spaceknowledge/widgets/background_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'PROFILE',
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: 4,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.asset(
                                  AppAssets.userImage,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 2.5.h),
                              Text(
                                'YTUE JGRHJ'.toTitleCase(),
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 19.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 0.8.h),
                              Text(
                                '@syfggtvyjb48',
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 15.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  // height: 1.4,
                                ),
                              ),
                              SizedBox(height: 2.8.h),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const IndexScreen(),
                                  //   ),
                                  // );
                                },
                                borderRadius: const BorderRadius.all(Radius.circular(52)),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(52)),
                                        color: AppColors.white.withOpacity(0.08),
                                        border: Border.all(
                                          color: AppColors.greySplash,
                                          width: 0.75,
                                        ),
                                      ),
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Column(
                        children: [
                          SettingsTileWidget(
                            iconPath: AppAssets.seetingsIcon,
                            text: 'Settings',
                            onTap: () {},
                          ),
                          SizedBox(height: 1.2.h),
                          SettingsTileWidget(
                            iconPath: AppAssets.passwordIcon,
                            text: 'Password',
                            onTap: () {},
                          ),
                          SizedBox(height: 1.2.h),
                          SettingsTileWidget(
                            iconPath: AppAssets.logoutIcon,
                            text: 'Log out',
                            onTap: () {},
                          ),
                        ],
                      ),
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

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    super.key,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  final String iconPath;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        iconPath,
        height: 19.sp,
        width: 19.sp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      horizontalTitleGap: 15,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.only(top: 6, left: 7, right: 6, bottom: 6),
            decoration: BoxDecoration(
              color: AppColors.greySplash,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
