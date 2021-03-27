import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Pages/splash_screen_page.dart';
import 'package:school/Utils/app_theme.dart';

void main() {
  runApp(School());
}

class School extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        home: SplashScreenPage(),
        theme: AppTheme.data(),
      );
}
