import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/models.dart';

class AttendanceController extends GetxController {
  String _selectYear = DateTime.now().year.toString();
  String _selectMonth = kMonths[DateTime.now().month - 1];
  StudentAttendance _attendance = StudentAttendance(0, 0, 0, 0);
  StudentAttendance get attendance => _attendance;

  set child(StudentAttendance attendance) {
    _attendance = attendance;
    update();
  }

  set selectedYear(String selectedYear) {
    _selectYear = selectedYear;
    update();
  }

  set selectedMonth(String selectedMonth) {
    _selectMonth = selectedMonth;
    update();
  }

  String get selectedYear => _selectYear;
  String get selectedMonth => _selectMonth;

  void loadAttendance(String studentID) async {
    if(selectedMonth == null || selectedYear == null){
      selectedMonth = kMonths[DateTime.now().month - 1];
      selectedYear = DateTime.now().year.toString();
    }
    String date = selectedYear+'-'+selectedMonth;
    _attendance = await APIInterface.getAttendance(studentID, date);
    update();
  }

  Future loadAttendanceHistory() async {
    String date = selectedYear+'-'+selectedMonth;
    var test = await APIInterface.attendanceHistory(date);
    return test;
  }
}
