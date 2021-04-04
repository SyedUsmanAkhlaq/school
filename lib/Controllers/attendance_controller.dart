import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

class AttendanceController extends GetxController {
  StudentAttendance _attendance = StudentAttendance(0, 0, 0, 0);
  StudentAttendance get attendance => _attendance;

  set child(StudentAttendance attendance) {
    _attendance = attendance;
    update();
  }

  void loadAttendance(String studentID) async {
    _attendance = await APIInterface.getAttendance(studentID);
    update();
  }

  Future loadAttendanceHistory() async {
    var test = await APIInterface.attendanceHistory();
    return test;
  }
}
