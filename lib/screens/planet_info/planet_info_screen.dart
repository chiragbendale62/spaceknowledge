import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/sphere_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/models/planet_model.dart';
import 'package:spaceknowledge/screens/home/widgets/three_d_globe_widget.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/app_extensions.dart';
import 'package:spaceknowledge/widgets/background_widgets.dart';
import 'package:spaceknowledge/widgets/blurred_icon_button.dart';

class PlanetInfoScreen extends StatefulWidget {
  const PlanetInfoScreen({super.key, required this.globe});

  final PlanetModel globe;

  @override
  State<PlanetInfoScreen> createState() => _PlanetInfoScreenState();
}

class _PlanetInfoScreenState extends State<PlanetInfoScreen> {
  late FlutterEarthGlobeController _controller;

  @override
  void initState() {
    // _animController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 10),
    // )..repeat();

    // _rotateAnimation = Tween<double>(
    //   begin: 1,
    //   end: 0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animController,
    //     curve: Curves.linear,
    //   ),
    // );
    _controller = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      zoom: 0.1,
      isRotating: true,
      isZoomEnabled: false,
      isBackgroundFollowingSphereRotation: false,
      surface: Image.asset(widget.globe.imagePath).image,
      sphereStyle: SphereStyle(
        showShadow: true,
        shadowBlurSigma: 15,
        shadowColor: widget.globe.shadowColor,
        shadowBlurStyle: BlurStyle.outer,
        showGradientOverlay: false,
      ),
      // surfaceConfiguration: ImageConfiguration.empty,
    );

    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundStarsWidget(
      childWidget: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: -55,
              right: -65,
              child: SizedBox(
                height: 260,
                width: 260,
                child: Hero(
                  tag: widget.globe.title,
                  flightShuttleBuilder: (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    return FadeTransition(
                      opacity: animation.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(
                            curve: Interval(0.0, 1.0, curve: ValleyQuadraticCurve()),
                          ),
                        ),
                      ),
                      child: toHeroContext.widget,
                    );
                  },
                  child: FlutterEarthGlobe(
                    alignment: Alignment.center,
                    onZoomChanged: (zoom) {
                      // setState(() {});
                    },
                    onTap: (coordinates) {
                      // setState(() {
                      //   // _clickCoordinates = coordinates;
                      // });
                    },
                    onHover: (coordinates) {
                      if (coordinates == null) return;

                      // setState(() {
                      // _hoverCoordinates = coordinates;
                      // });
                    },
                    controller: _controller,
                    radius: 100,
                  ),
                ),
              ),
            ),
            SafeArea(
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
                        BlurredIconButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          icon: Icons.arrow_back_ios_new_rounded,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.8.h),
                    Text(
                      widget.globe.title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      widget.globe.subtitle,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.blueLightColor,
                        fontWeight: FontWeight.w500,
                        // height: 1.4,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    widget.globe.planetDetails != null
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'About ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.blueLightColor,
                                        fontWeight: FontWeight.w400,
                                        // height: 1.4,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: widget.globe.title.toCapitalized(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 1.6.h),
                                  Text(
                                    widget.globe.planetDetails?.description ?? '',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      // height: 1.4,
                                    ),
                                  ),
                                  SizedBox(height: 2.5.h),
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppAssets.mercuryGlobe,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: AppColors.greySplash,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 20.sp,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.5.h),
                                  UnderlineTextValueWidget(
                                    text: 'Distance from sun:',
                                    value: " ${widget.globe.planetDetails?.distanceFromSun}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Length of day:',
                                    value: " ${widget.globe.planetDetails?.lengthOfDay}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Orbital period:',
                                    value: " ${widget.globe.planetDetails?.orbitalPeriod}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Radius:',
                                    value: " ${widget.globe.planetDetails?.radius}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Mass:',
                                    value: " ${widget.globe.planetDetails?.mass}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Gravity:',
                                    value: " ${widget.globe.planetDetails?.gravity}",
                                  ),
                                  UnderlineTextValueWidget(
                                    text: 'Surface area:',
                                    value: " ${widget.globe.planetDetails?.surfaceArea}",
                                  ),
                                  const SizedBox(height: 70),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      height: 50,
                      // padding: const EdgeInsets.only(top: 10, left: 9, right: 11, bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          'Take a trip',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            // height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnderlineTextValueWidget extends StatelessWidget {
  const UnderlineTextValueWidget({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w400,
          height: 1.8,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.white,
              decorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
