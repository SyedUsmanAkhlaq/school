import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

/// Created by Usman Akhlaq on 22.05.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class EventController extends GetxController {
  StudentEvents _events;

  StudentEvents get events => _events;

  set studentEvents(StudentEvents events) {
    _events = events;
    update();
  }

  void loadData(String date) async {
    _events = await APIInterface.events(date);
    update();
  }
}
