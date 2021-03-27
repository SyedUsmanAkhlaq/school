import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/transparent_image.dart';

import 'drawer_items.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
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
                height: sizeConfig.height(.4),
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
                          image: NetworkImage('ghjshfsj'),
                          placeholder: MemoryImage(kTransparentImage),
                          imageErrorBuilder: (BuildContext context,
                                  Object object, StackTrace trace) =>
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
                    GetBuilder<ChildrenController>(
                      builder: (value) => Container(
                        margin: EdgeInsets.only(
                          top: sizeConfig.height(.02),
                          left: sizeConfig.width(.07),
                        ),
                        child: Text(
                          value?.child?.userName ?? 'Name not available',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    GetBuilder<ChildrenController>(
                      builder: (value) => Container(
                        margin: EdgeInsets.only(
                          // top: sizeConfig.height(.01),
                          left: sizeConfig.width(.07),
                        ),
                        child: Text(
                          value?.child?.branchID ?? 'Class not available',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                    GetBuilder<ChildrenController>(
                      builder: (value) => Container(
                        margin: EdgeInsets.only(
                          // top: sizeConfig.height(.01),
                          left: sizeConfig.width(.07),
                        ),
                        child: Text(
                          value?.child?.className ?? 'Class not available',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DrawerItems(
                leadingIcon: 'assets/notification.png',
                label: 'Notifications',
                // onTap: () => Get.to(FavouritePage()),
              ),
              DrawerItems(
                leadingIcon: 'assets/voucher.png',
                label: 'Vouchers',
              ),
              DrawerItems(
                leadingIcon: 'assets/payment_history.png',
                label: 'Payment History',
              ),
              DrawerItems(
                leadingIcon: 'assets/basic_information.png',
                label: 'Basic Information',
              ),
            ],
          ),
        ),
      );
}
