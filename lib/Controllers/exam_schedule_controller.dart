import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

/// Created by Usman Akhlaq on 22.05.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class ExamScheduleController extends GetxController {
  List<ExamSchedule> _events;

  List<ExamSchedule> get events => _events;

  set examSchedule(List<ExamSchedule> events) {
    _events = events;
    update();
  }

  void loadData(String classID, String sectionID) async {
    _events = await APIInterface.examSchedule(classID, sectionID);
    update();
  }
}
