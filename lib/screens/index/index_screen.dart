import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaceknowledge/providers/index_provider.dart';
import 'package:spaceknowledge/screens/bookmark/bookmark_screen.dart';
import 'package:spaceknowledge/screens/galaxy/galaxy_screen.dart';
import 'package:spaceknowledge/screens/home/home_screen.dart';
import 'package:spaceknowledge/screens/index/widgets/bottom_bar_item_widget.dart';
import 'package:spaceknowledge/screens/profile/profile_screen.dart';
import 'package:spaceknowledge/screens/search/search_screen.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IndexProvider>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.transparent,
      bottomNavigationBar: SafeArea(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: provider.selectedIndex == 2 ? 0 : 45,
              sigmaY: provider.selectedIndex == 2 ? 0 : 45,
            ),
            child: Container(
              height: 62,
              width: double.infinity,
              decoration: BoxDecoration(
                color: provider.selectedIndex == 2 ? AppColors.black : AppColors.navBarBgColor,
                border: Border(
                  top: BorderSide(
                    color: AppColors.greySplash,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  BottomBarItemWidget(
                    onTap: () => provider.changeBottomIndex(0),
                    index: 0,
                    imagePath: AppAssets.home,
                    activeImagePath: AppAssets.homeActive,
                    imageHeight: 25,
                    imageWidth: 25,
                  ),
                  BottomBarItemWidget(
                    onTap: () => provider.changeBottomIndex(1),
                    index: 1,
                    imagePath: AppAssets.search,
                    activeImagePath: AppAssets.searchActive,
                    imageHeight: 32,
                    imageWidth: 27,
                  ),
                  BottomBarItemWidget(
                    onTap: () => provider.changeBottomIndex(2),
                    index: 2,
                    imagePath: AppAssets.rocket,
                    activeImagePath: AppAssets.rocketActive,
                    imageHeight: 42,
                    imageWidth: 42,
                  ),
                  BottomBarItemWidget(
                    onTap: () => provider.changeBottomIndex(3),
                    index: 3,
                    imagePath: AppAssets.bookmark,
                    activeImagePath: AppAssets.bookmarkActive,
                    imageHeight: 25,
                    imageWidth: 25,
                  ),
                  BottomBarItemWidget(
                    onTap: () => provider.changeBottomIndex(4),
                    index: 4,
                    imagePath: AppAssets.profile,
                    activeImagePath: AppAssets.profileActive,
                    imageHeight: 25,
                    imageWidth: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: provider.pageController,
        // onPageChanged: (value) {
        //   // provider.changeBottomIndex(value);
        // },
        children: const [
          HomeScreen(),
          SearchScreen(),
          GalaxyScreen(),
          BookmarkScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
