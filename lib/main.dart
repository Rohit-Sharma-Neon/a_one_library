import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_app/scaled_app.dart';

import 'services/firebase_notification_service.dart';
import 'ui/base_components/base_main_builder.dart';
import 'ui/screens/splash/splash_screen.dart';
import 'utils/base_colors.dart';
import 'utils/base_localization.dart';

void main() {
  runAppScaled(const MyApp(), scaleFactor: (deviceSize) {
    const double widthOfDesign = 375;
    return deviceSize.width / widthOfDesign;
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await FirebaseNotificationService().initFirebase();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Learning Project',
      debugShowCheckedModeBanner: false,
      translations: BaseLocalization(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.dark,
      builder: (BuildContext context, Widget? child) {
        return BaseMainBuilder(context: context, child: child);
      },
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.primaryColor),
        primaryColor: BaseColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: BaseColors.cardColor,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder()
        }),
      ),
      home: const SplashScreen(),
    );
  }
}
