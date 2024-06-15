import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_nuwa/screens/dashboard/admin_dashboard.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:flutter_nuwa/utils/app_img.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void doSplash() {
    Timer(
      const Duration(seconds: 2),
      () {
        Get.to(() => const AdminDashboard());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    doSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mWhite,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(AppImg.imgLogo).image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
