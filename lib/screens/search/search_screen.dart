import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/providers/search_provider.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/app_constants.dart';
import 'package:spaceknowledge/utilities/app_string.dart';
import 'package:spaceknowledge/widgets/background_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context, listen: true);

    return BackgroundStarsWidget(
      childWidget: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          maintainBottomViewPadding: false,
          bottom: false,
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
                      'SEARCH',
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
                      Container(
                        width: double.infinity,
                        // height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.white,
                              width: 0.6,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: provider.searchController,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white,
                            height: 1,
                          ),
                          cursorColor: AppColors.white,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: AppColors.white,
                            filled: true,
                            fillColor: AppColors.white.withOpacity(0.08),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 13,
                            ),
                            border: searchFieldBorder,
                            enabledBorder: searchFieldBorder,
                            focusedBorder: searchFieldBorder,
                            hintText: 'Search for planets or galaxies',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColors.white.withOpacity(0.75),
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Planets in our solar system',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.blueLightColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppString.gorditaFontFamily,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Expanded(
                        child: ListView.separated(
                          primary: true,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(),
                          itemCount: provider.planetsList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 2.4.h);
                          },
                          itemBuilder: (context, index) {
                            var planet = provider.planetsList[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.only(),
                              horizontalTitleGap: 24,
                              leading: Image.asset(
                                planet.imagePath,
                                height: 52,
                                width: 52,
                              ),
                              title: Text(
                                planet.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.blueLightColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppString.gorditaFontFamily,
                                ),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
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
