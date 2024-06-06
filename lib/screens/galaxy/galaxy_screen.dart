import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';

class GalaxyScreen extends StatefulWidget {
  const GalaxyScreen({super.key});

  @override
  State<GalaxyScreen> createState() => _GalaxyScreenState();
}

class _GalaxyScreenState extends State<GalaxyScreen> {
  late FlutterEarthGlobeController _controller;

  @override
  void initState() {
    _controller = FlutterEarthGlobeController(
      zoom: 0.5,
      rotationSpeed: 0.05,
      isRotating: true,
      isZoomEnabled: true,
      isBackgroundFollowingSphereRotation: true,
      background: Image.asset(AppAssets.starsBackground).image,
      surface: Image.asset(AppAssets.earthGlobe).image,
      maxZoom: 1,
      minZoom: 0.20,
      // surfaceConfiguration: ImageConfiguration(),
      // sphereStyle: SphereStyle(
      //   shadowColor: Colors.orange.withOpacity(0.8),
      //   shadowBlurSigma: 20,
      // ),
    );

    // _controller.onLoaded = () {
    //   _controller.loadBackground(
    //     Image.asset(AppAssets.starsBackground).image,
    //     isBackgroundFollowingSphereRotation: true,
    //   );
    //   _controller.loadSurface(
    //     Image.asset(
    //       AppAssets.earthDay,
    //     ).image,
    //   );
    //   _controller.setSphereStyle(
    //     SphereStyle(
    //       shadowColor: Colors.orange.withOpacity(0.8),
    //       shadowBlurSigma: 20,
    //     ),
    //   );
    // };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:

            // WebViewWidget(
            //   controller: WebViewController()
            //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
            //     ..setBackgroundColor(const Color(0x00000000))
            //     ..setNavigationDelegate(
            //       NavigationDelegate(
            //         onProgress: (int progress) {
            //           // Update loading bar.
            //         },
            //         onPageStarted: (String url) {},
            //         onPageFinished: (String url) {},
            //         onWebResourceError: (WebResourceError error) {},
            //         onNavigationRequest: (NavigationRequest request) {
            //           // if (request.url.startsWith('https://www.youtube.com/')) {
            //           //   return NavigationDecision.prevent;
            //           // }
            //           return NavigationDecision.navigate;
            //         },
            //       ),
            //     )
            //     ..loadRequest(Uri.parse('https://eyes.nasa.gov/apps/solar-system/#/home')),
            // ),

            FlutterEarthGlobe(
          controller: _controller,
          radius: 80,
        ),
      ),
    );
  }
}
