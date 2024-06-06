// ignore_for_file: unused_field
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/sphere_style.dart';
import 'package:spaceknowledge/models/planet_model.dart';

class ThreeDGlobeWidget extends StatefulWidget {
  const ThreeDGlobeWidget({
    super.key,
    required this.globe,
  });

  final PlanetModel globe;

  @override
  State<ThreeDGlobeWidget> createState() => _ThreeDGlobeWidgetState();
}

class _ThreeDGlobeWidgetState extends State<ThreeDGlobeWidget> with SingleTickerProviderStateMixin {
  late FlutterEarthGlobeController _controller;
  // late AnimationController _animController;

  // late Animation<double> _rotateAnimation;

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
      zoom: 0.62,
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
    // _animController.dispose();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<HomeProvider>(context, listen: true);
    double radius = MediaQuery.of(context).size.width < 500 ? ((MediaQuery.of(context).size.width / 3.8) - 20) : 120;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(12),
        //   child: RotationTransition(
        //     turns: _rotateAnimation,
        //     child: Image.asset(
        //       AppAssets.singleMoonRing,
        //     ),
        //   ),
        // ),

        Hero(
          tag: widget.globe.title,
          flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
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
            radius: radius,
          ),
        ),
      ],
    );
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * math.pow(t - 0.5, 2).toDouble();
  }
}
