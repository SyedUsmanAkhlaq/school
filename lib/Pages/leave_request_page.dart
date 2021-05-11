import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gx_file_picker/gx_file_picker.dart';
import 'package:school/Controllers/leave_controller.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:school/Widgets/primary_button.dart';
import 'package:school/Widgets/process_handler.dart';

/// Created by Usman Akhlaq on 29.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class LeaveRequestPage extends StatefulWidget {
  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _reasonController = TextEditingController();
  File file;

  @override
  Widget build(BuildContext context) => ProcessHandler<LeaveController>(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: _appBar(context),
          drawer: _drawer(),
          body: _body(),
        ),
      );

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Leave Request',
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

  _body() => Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: sizeConfig.height(.04),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.02),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.06),
                ),
                child: DropdownButton(
                    dropdownColor: Colors.white,
                    items: leaveType
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(
                              value.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: Container(),
                    value: 'Select Leave Type'),
              ),
              GetBuilder<LeaveController>(
                builder: (value) => InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeConfig.width(.02),
                      vertical: sizeConfig.height(.015),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: sizeConfig.width(.06),
                      vertical: sizeConfig.height(.03),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value.startDate == null
                              ? 'Select Date'
                              : '${value.startDate}-${value.endDate}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Icon(Icons.date_range_outlined),
                      ],
                    ),
                  ),
                  onTap: _selectDateRange,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.05),
                ),
                child: TextFormField(
                  controller: _reasonController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Reason',
                  ),
                  validator: (String input) => input == null || input.isEmpty
                      ? "Please enter your reason for leave."
                      : null,
                ),
              ),
              InkWell(
                onTap: _selectFile,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.width(.02),
                    vertical: sizeConfig.height(.015),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: sizeConfig.width(.06),
                    vertical: sizeConfig.height(.03),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Attach Document',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Icon(Icons.attach_file),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                label: 'Submit',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPress: _sendLeaveRequest,
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.09),
                ),
                borderRadius: 5,
              ),
            ],
          ),
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();

  void _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      lastDate: DateTime(DateTime.now().year + 1),
      firstDate: DateTime(2000),
    );
    if (picked != null && picked != null) {
      Get.find<LeaveController>().startDate = picked.start.toString();
      Get.find<LeaveController>().endDate = picked.end.toString();
    }
  }

  void _selectFile() async => file = await FilePicker.getFile();

  void _sendLeaveRequest() => Get.find<LeaveController>()
      .sendLeaveRequest(_reasonController.text, file);
}
