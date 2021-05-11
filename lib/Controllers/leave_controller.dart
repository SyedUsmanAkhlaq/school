import 'dart:io';

import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/mixins.dart';

/// Created by Usman Akhlaq on 05.05.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class LeaveController extends GetxController with ProcessMixin {
  String _startDate;
  String _endDate;

  File file;

  set startDate(String startDate) {
    DateTime dateTime = DateTime.parse(startDate);
    _startDate = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    print(_startDate);
    update();
  }

  set endDate(String endDate) {
    DateTime dateTime = DateTime.parse(endDate);
    _endDate = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    print(_endDate);
    update();
  }

  String get startDate => _startDate;

  String get endDate => _endDate;

  Future<bool> sendLeaveRequest(String reason, File file) async {
    start();
    bool success =
        await APIInterface.sendLeaveRequest(_startDate, _endDate, reason, file);
    print('Leave Controller: success: $success');
    stop();
    return success;
  }
}
