import 'package:dio/dio.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/models.dart';

class APIInterface {
  static Future<String> login(String email, String password) async {
    try {
      var url = 'http://ramom.logicsfort.com/api/user/login';
      Response response = await Dio().post(
        url,
        data: FormData.fromMap({'email': email, 'password': password}),
      );
      print(response.statusCode);
      if (response.data['success']) {
        return response.data['id_token'];
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Login: $e: $s");
      return null;
    }
  }

  static Future<Parent> parentData(String id) async {
    try {
      var url = "https://ramom.logicsfort.com/api/user/parentprofile?id=$id";
      // print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data['parent']);
        Parent parent = Parent.fromJSON(response.data['parent']);
        return parent;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: ParentData: $e: $s");
      return null;
    }
  }

  static Future<List<Children>> childrenData(String parentID) async {
    try {
      print('This is parentID: $parentID');
      var url =
          "https://ramom.logicsfort.com/api/user/parentprofile?id=$parentID";
      // print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        // print(response.data['childs']);
        List<Children> children = [];
        response.data['childs']?.forEach((element) {
          children.add(Children.fromJSON(element));
        });
        // print(children);
        return children;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Children Data: $e: $s");
      return null;
      // return Response.error(errorMessage: e.toString());
    }
  }

  static Future<Child> childData(String studentID) async {
    try {
      var url =
          "https://ramom.logicsfort.com/api/user/studentprofile?id=$studentID";
      // print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        // print(response.data['student']);
        Child child;
        child = Child.fromJSON(response.data['student']);
        // print(child);
        return child;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Child Data: $e: $s");
      return null;
      // return Response.error(errorMessage: e.toString());
    }
  }

  static Future<StudentAttendance> getAttendance(String studentID) async {
    try {
      var url =
          "http://ramom.logicsfort.com/api/user/studentAttendance?student_id=$studentID";
      // print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        int present = response.data['total_present'];
        int absent = response.data['total_absent'];
        int late = response.data['total_late'];
        int hospital = response.data['total_hospital'];
        StudentAttendance attendance =
            StudentAttendance(present, absent, late, hospital);
        return attendance;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Get Attendance: $e: $s");
      return null;
      // return Response.error(errorMessage: e.toString());
    }
  }

  static Future<List<AttendanceHistory>> attendanceHistory() async {
    try {
      var url =
          "http://ramom.logicsfort.com/api/user/studentAttendance?student_id=6&timestamp=${DateTime.now().year}-${kMonths[DateTime.now().month - 1]}";
      print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<AttendanceHistory> history = [];
        Map json = response.data['atten'];
        json.forEach((key, value) {
          history.add(AttendanceHistory.fromJSON(value));
        });
        return history;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Attendance History: $e: $s");
      return null;
      // return Response.error(errorMessage: e.toString());
    }
  }

  static Future<List<Voucher>> getVouchers(String studentID) async {
    try {
      var url =
          "https://ramom.logicsfort.com/api/user/studentfee?id=$studentID";
      print(url);
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<Voucher> vouchers = [];
        response.data['fee_detail']?.forEach((element) {
          vouchers.add(Voucher.fromJSON(element));
        });
        return vouchers;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Attendance History: $e: $s");
      return null;
    }
  }
}
