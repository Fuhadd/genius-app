import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to another screen after 2 seconds
    Future.delayed(const Duration(seconds: 4), () {
      context.goNamed(RouteConstants.onboardingPageView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryGreenColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              ConstantString.splashWave,
            ),
            Image.asset(
              ConstantString.geniusLogo,
              width: 1.sw * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
