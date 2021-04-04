import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/attendance_controller.dart';
import 'package:school/Controllers/authentication_controller.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Controllers/voucher_controller.dart';
import 'package:school/Pages/sign_in_page.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/size_config.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    /// Initializing Controllers
    Get.put<ChildrenController>(ChildrenController());
    Get.put<AttendanceController>(AttendanceController());
    Get.put<VoucherController>(VoucherController());
    Get.put<AuthenticationController>(AuthenticationController());

    Future.delayed(
      Duration(seconds: 4),
      () => Get.to(
        SignInPage(),
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeConfig = SizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  _body() => Container(
        // padding: EdgeInsets.only(top: sizeConfig.safeArea.top),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: sizeConfig.height(.2),
              ),
              child: Text(
                'School App',
                style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: sizeConfig.height(.02),
                ),
                // color: Colors.blue,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.35),
                ),
                child: Image.asset(
                  'assets/splash_screen_image.png',
                ),
              ),
            ),
          ],
        ),
      );
}
