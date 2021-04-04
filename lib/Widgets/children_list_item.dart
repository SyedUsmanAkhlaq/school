import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Pages/student_home_page.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';
import 'package:school/Widgets/transparent_image.dart';

/// Created by Usman Akhlaq on 19.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class ChildrenListItem extends StatelessWidget {
  final Children children;

  const ChildrenListItem({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _goToDetailPage,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.width(.03),
            vertical: sizeConfig.height(.02),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: sizeConfig.width(.08),
            vertical: sizeConfig.height(.02),
          ),
          child: Row(
            children: [
              _image(),
              _details(context),
              Spacer(),
              Text(
                children.childClass,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      );

  _image() => ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Container(
          // color: Colors.grey[200],
          child: FadeInImage(
            height: sizeConfig.height(.11),
            width: sizeConfig.height(.11),
            image: NetworkImage(children.childImageURL),
            placeholder: MemoryImage(kTransparentImage),
            imageErrorBuilder:
                (BuildContext context, Object object, StackTrace trace) =>
                    Container(
              height: sizeConfig.height(.09),
              width: sizeConfig.height(.09),
              alignment: Alignment.center,
              color: Colors.black26,
              child: Text(
                'No\nImage',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );

  _details(BuildContext context) => Container(
        margin: EdgeInsets.only(
          left: sizeConfig.width(.02),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              children.childUserName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: sizeConfig.height(.01),
            ),
            Text(
              children.childSection,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      );
  void _goToDetailPage() {
    print(children.childID);
    Get.find<ChildrenController>().selectedChildren = children;
    print(Get.find<ChildrenController>().selectedChildren.childID);
    Get.find<ChildrenController>().loadChildData(children.childID);
    Get.to(
      StudentHomePage(
        children: children,
      ),
    );
  }
}
