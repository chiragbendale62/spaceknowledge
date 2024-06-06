import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';

class ContinuouslyRotatingEarth extends StatefulWidget {
  final double earthRadius; // Radius of the Earth sphere (optional)
  final String earthTexturePath; // Path to your Earth texture (optional)

  const ContinuouslyRotatingEarth({
    super.key,
    this.earthRadius = 100.0, // Default radius
    this.earthTexturePath = '', // Empty texture path by default
  });

  @override
  State<ContinuouslyRotatingEarth> createState() => _ContinuouslyRotatingEarthState();
}

class _ContinuouslyRotatingEarthState extends State<ContinuouslyRotatingEarth> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late double _rotationAngle; // Current rotation angle in radians

  late FlutterEarthGlobeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlutterEarthGlobeController(
      rotationSpeed: 0.05,
      isBackgroundFollowingSphereRotation: true,
      // background: Image.asset('assets/2k_stars.jpg').image,
      surface: Image.asset('assets/images/earth_planet.png').image,
    );
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _rotationAngle = 0.0; // Start with no rotation

    _animationController.addListener(() {
      setState(() {
        _rotationAngle = _animationController.value * 2 * math.pi; // Convert to radians
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(_rotationAngle),
      child: widget.earthTexturePath.isEmpty
          ? FlutterEarthGlobe(
              // Use Globe widget from flutter_globe if no texture provided
              radius: widget.earthRadius,
              controller: _controller,
            )
          : Image.asset(
              // Use Image widget with texture path if provided
              widget.earthTexturePath,
              width: widget.earthRadius * 2,
              height: widget.earthRadius * 2,
            ),
    );
  }
}
