import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/drawer.dart';
import 'package:school/Widgets/transparent_image.dart';

/// Created by Usman Akhlaq on 29.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class BasicInformationPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(context),
      drawer: _drawer(),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Basic Information',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white),
        ),
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: _openDrawer),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      );

  _drawer() => CustomDrawer();

  _body(BuildContext context) => GetBuilder<ChildrenController>(
        builder: (value) => Container(
          child: Column(
            children: [
              Container(
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
                  horizontal: sizeConfig.width(.06),
                  vertical: sizeConfig.height(.03),
                ),
                child: Row(
                  children: [
                    _image(),
                    _details(context),
                    Spacer(),
                    Text(
                      child.className,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.06),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.02),
                  horizontal: sizeConfig.width(.06),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reg. No',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.registerNo,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            'Roll. No',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.role,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.7),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Admission Date',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.admissionDate,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date of Birth',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.birthday,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.7),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Blood Group',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.bloodGroup,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mobile No.',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.mobileNo,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.7),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.city,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            'State',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.state,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.height(.02),
                        horizontal: sizeConfig.width(.03),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Address:',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            child.currentAddress,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
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
            image: NetworkImage(child.imageURL),
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
              child.userName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: sizeConfig.height(.01),
            ),
            Text(
              child.sectionName,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();
}
