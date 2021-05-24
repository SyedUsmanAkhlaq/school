import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:school/Controllers/diary_controller.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/date_selection_bar.dart';
import 'package:school/Widgets/drawer.dart';
import 'package:permission_handler/permission_handler.dart';

/// Created by Usman Akhlaq on 20.05.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class DiaryDetailPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DiaryDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(context),
        drawer: _drawer(),
        body: _body(context),
      );

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Diary',
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

  _body(BuildContext context) => Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _timeLine(context),
              _subjectTile(context),
              _attachments(context),
            ],
          ),
        ),
      );

  _timeLine(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.05),
          vertical: sizeConfig.height(.04),
        ),
        decoration: BoxDecoration(
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
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.05),
                vertical: sizeConfig.height(.02),
              ),
              child: Text(
                '${kMonths[DateTime.now().month - 1]}',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.05),
              ),
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            DateSelectionBar(onDateSelected: _onDateSelected),
          ],
        ),
      );

  _subjectTile(BuildContext context) => GetBuilder<DiaryController>(
        builder: (value) => Row(
          children: List.generate(
            value.diary.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.05),
              ),
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.02),
                horizontal: sizeConfig.width(.01),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: sizeConfig.width(.02),
                    ),
                    child: Text(
                      value.diary[index].subjectName,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sizeConfig.height(.04),
                    ),
                    alignment: Alignment.center,
                    height: sizeConfig.height(.1),
                    width: sizeConfig.width(.5),
                    child: Image.network(
                      value.diary[index].documentPath,
                    ),
                  ),
                  Text(
                    value.diary[index].description,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  _attachments(BuildContext context) => GetBuilder<DiaryController>(
        builder: (value) => Row(
          children: List.generate(
            value.diary.length,
            (index) => Container(
              width: sizeConfig.width(.8),
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.04),
                horizontal: sizeConfig.width(.05),
              ),
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.04),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sizeConfig.height(.02),
                      horizontal: sizeConfig.width(.02),
                    ),
                    child: Text(
                      'Attachment',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sizeConfig.height(.005),
                      horizontal: sizeConfig.width(.02),
                    ),
                    child: Text(
                      value.diary[index].subjectName,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: sizeConfig.height(.005),
                      horizontal: sizeConfig.width(.02),
                    ),
                    child: Text(
                      value.diary[index].description,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: sizeConfig.width(.02),
                    ),
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          _downloadAttachment(value.diary[index].documentPath),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.file_download,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Download',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();

  void _onDateSelected(DateTime dateTime) => DateTime.now();

  void _downloadAttachment(String url) async {
    PermissionStatus success = await Permission.storage.request();
    if (success.isGranted) {
      Directory appDocsDirectory = await getApplicationDocumentsDirectory();
      String fullPath = "${appDocsDirectory.absolute.path}";
      Get.find<DiaryController>().downloadAttachment(url, fullPath);
    }
  }
}
