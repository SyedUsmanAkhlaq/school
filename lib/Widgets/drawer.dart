import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Controllers/theme_controller.dart';
import 'package:school/Pages/basic_information_page.dart';
import 'package:school/Pages/leave_request_page.dart';
import 'package:school/Pages/notification_page.dart';
import 'package:school/Pages/payment_history_page.dart';
import 'package:school/Pages/sign_in_page.dart';
import 'package:school/Pages/student_home_page.dart';
import 'package:school/Pages/voucher_page.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/transparent_image.dart';

import 'drawer_items.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  ThemeMode _themeMode;
  @override
  Widget build(BuildContext context) {
    _themeMode = ThemeController.to.themeMode;
    return Container(
      color: Colors.black,
      constraints: BoxConstraints(
        maxWidth: sizeConfig.width(.7),
      ),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: sizeConfig.height(.35),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: sizeConfig.height(.1),
                      left: sizeConfig.width(.05),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: FadeInImage(
                        height: sizeConfig.height(.13),
                        width: sizeConfig.height(.13),
                        image: NetworkImage(child.imageURL),
                        placeholder: MemoryImage(kTransparentImage),
                        imageErrorBuilder: (BuildContext context, Object object,
                                StackTrace trace) =>
                            Container(
                          height: sizeConfig.height(.13),
                          width: sizeConfig.height(.13),
                          alignment: Alignment.center,
                          color: Colors.black26,
                          child: Text(
                            'No\nImage',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontSize: 13),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: sizeConfig.height(.02),
                      left: sizeConfig.width(.07),
                    ),
                    child: Text(
                      child?.userName ?? 'Name not available',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      // top: sizeConfig.height(.01),
                      left: sizeConfig.width(.07),
                    ),
                    child: Text(
                      child?.branchID ?? 'Class not available',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      // top: sizeConfig.height(.01),
                      left: sizeConfig.width(.07),
                    ),
                    child: Text(
                      child?.className ?? 'Class not available',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
            DrawerItems(
              leadingIcon: Icons.home_filled,
              label: 'Home',
              onTap: () => Get.to(
                StudentHomePage(
                  children: Get.find<ChildrenController>().selectedChildren,
                ),
              ),
            ),
            DrawerItems(
              leadingIcon: Icons.notifications,
              label: 'Notifications',
              onTap: () => Get.to(
                NotificationPage(),
              ),
            ),
            DrawerItems(
              leadingIcon: FontAwesomeIcons.ticketAlt,
              label: 'Vouchers',
              onTap: () => Get.to(
                VoucherPage(),
              ),
            ),
            DrawerItems(
              leadingIcon: Icons.history_edu,
              label: 'Payment History',
              onTap: () => Get.to(
                PaymentHistoryPage(),
              ),
            ),
            DrawerItems(
              leadingIcon: FontAwesomeIcons.readme,
              label: 'Leave Request',
              onTap: () => Get.to(
                LeaveRequestPage(),
              ),
            ),
            DrawerItems(
              leadingIcon: Icons.insert_drive_file,
              label: 'Basic Information',
              onTap: () => Get.to(
                BasicInformationPage(),
              ),
            ),
            Spacer(),
            DrawerItems(
              leadingIcon: FontAwesomeIcons.palette,
              label: 'Dark Mode',
            ),
            DrawerItems(
              leadingIcon: Icons.exit_to_app,
              label: 'Sign Out',
              onTap: () => _signOut(context),
            ),
            SizedBox(
              height: sizeConfig.height(.04),
            ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
      (route) => false,
    );
  }
}
