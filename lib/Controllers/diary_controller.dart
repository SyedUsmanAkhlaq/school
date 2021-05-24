import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

/// Created by Usman Akhlaq on 20.05.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class DiaryController extends GetxController {
  List<Diary> _diaryList = [];

  List<Diary> get diary => _diaryList;

  set diary(List<Diary> diary) {
    _diaryList = diary;
    update();
  }

  void loadData(String date, String studentID) async {
    _diaryList = await APIInterface.studentDiary(studentID, date);
    update();
  }

  void downloadAttachment(String url, String path) {
    APIInterface.downloadFile(url, path);
  }
}
