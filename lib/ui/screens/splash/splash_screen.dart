import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_project/ui/screens/live_students/live_students_screen.dart';
import 'package:learning_project/utils/base_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // BaseController baseController = Get.put(BaseController());

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 2), () async {
      Get.offAll(const LiveStudentsScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInUp(
          child: SvgPicture.asset(
            height: 130,
            width: 130,
            BaseAssets.icReadingStudent,
          ),
        ),
      ),
    );
  }
}
