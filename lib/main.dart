import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spaceknowledge/app_providers.dart';
import 'package:spaceknowledge/screens/splash/splash_screen.dart';
import 'package:spaceknowledge/theme/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: AppColors.black,
  //     systemNavigationBarColor: AppColors.navBarBgColor,
  //     systemNavigationBarDividerColor: AppColors.white,
  //   ),
  // );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: AppProviders.providers,
          child: MaterialApp(
            title: 'Space',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
