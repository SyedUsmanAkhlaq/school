import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';

class APIInterface {
  static Dio _dio = Dio();
  static final String baseAPI = 'http://demo.aanttech.com/api';
  static String authToken;

  static Future<bool> login(String email, String password) async {
    try {
      String url = '$baseAPI/auth/login';
      Response response = await _dio.post(
        url,
        options: Options(
          sendTimeout: 30000,
          receiveTimeout: 30000,
        ),
        data: FormData.fromMap({'email': email, 'password': password}),
      );
      authToken = response.data['token'];
      token = JwtDecoder.decode(response.data['token']);
      return true;
    } catch (e, s) {
      print("API Interface: Login: $e: $s");
      return false;
    }
  }

  static Future<Parent> parentData(String id) async {
    try {
      var url = "$baseAPI/user/parentprofile?id=$id";
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        Parent parent = Parent.fromJSON(response.data['profile']['parent']);
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
      String url = "$baseAPI/user/parentprofile?id=$parentID";
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<Children> children = [];
        response.data['profile']['childs']?.forEach((element) {
          children.add(Children.fromJSON(element));
        });
        return children;
      } else {
        return null;
      }
    } catch (e, s) {
      print("API Interface: Children Data: $e: $s");
      return null;
    }
  }

  static Future<Child> childData(String studentID) async {
    try {
      var url = "$baseAPI/user/studentprofile?student_id=$studentID";
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        Child child = Child.fromJSON(response.data['student']);
        return child;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Child Data: $e: $s");
      return null;
      // return Response.error(errorMessage: e.toString());
    }
  }

  static Future<StudentAttendance> getAttendance(
      String studentID, String date) async {
    try {
      var url =
          "$baseAPI/user/attendance?timestamp=2021-February&userID=$studentID";
      // print(url);
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        int present = response.data['attendance']['total_present'];
        int absent = response.data['attendance']['total_absent'];
        int late = response.data['attendance']['total_late'];
        int hospital = response.data['attendance']['total_hospital'];
        StudentAttendance attendance =
            StudentAttendance(present, absent, late, hospital);
        return attendance;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Get Attendance: $e: $s");
      return null;
    }
  }

  static Future<List<AttendanceHistory>> attendanceHistory(String date) async {
    try {
      var url =
          "$baseAPI/user/attendance?timestamp=$date&userID=${child.enrollID}";
      // print(url);
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.data['status']) {
        List<AttendanceHistory> history = [];
        response.data['attendance']['attendance'].forEach(
          (element) {
            history.add(
              AttendanceHistory.fromJSON(element),
            );
          },
        );
        return history;
      } else
        return null;
    } catch (e, s) {
      print("API Interface: Attendance History: $e: $s");
      return null;
    }
  }

  static Future<List<Voucher>> getVouchers(String studentID) async {
    try {
      var url = "$baseAPI/studentfee?id=$studentID";
      print(url);
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
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

  static Future<bool> sendLeaveRequest(
      String startDate, String endDate, String reason, File file) async {
    try {
      var url = "$baseAPI/user/leave";
      print(startDate);
      print(endDate);
      print(reason);
      print(file.absolute);
      Response response = await _dio.post(
        url,
        data: FormData.fromMap({
          'leave_category': '1',
          'daterange': '$startDate-$endDate',
          'reason': reason,
          'attachment_file': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          )
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e, s) {
      print("API Interface: Attendance History: $e: $s");
      return false;
    }
  }
}
