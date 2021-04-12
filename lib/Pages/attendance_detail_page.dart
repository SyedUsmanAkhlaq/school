import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/attendance_controller.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';
import 'package:school/Widgets/attendance_details.dart';
import 'package:school/Widgets/drawer.dart';

class AttendanceDetailPage extends StatefulWidget {
  @override
  _AttendanceDetailPageState createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(context),
        body: _body(context),
        drawer: _drawer(),
      );

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Attendance',
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.03),
                  horizontal: sizeConfig.width(.04),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.03),
                  horizontal: sizeConfig.width(.04),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntrinsicHeight(
                  child: GetBuilder<AttendanceController>(
                    builder: (value) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AttendanceDetail(
                          heading: 'Attendance',
                          value: value.attendance?.present,
                          color: Colors.green,
                        ),
                        VerticalDivider(
                          thickness: .05,
                          color: Colors.black,
                        ),
                        AttendanceDetail(
                          heading: 'Late',
                          value: value.attendance?.late,
                          color: Colors.orangeAccent,
                        ),
                        VerticalDivider(
                          thickness: .05,
                          color: Colors.black,
                        ),
                        AttendanceDetail(
                          heading: 'Absent',
                          value: value.attendance?.absent,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      dropdownColor: Colors.white,
                      items: kYears
                          .map<DropdownMenuItem<String>>(
                            (int value) => DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                value.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                          .toList(),
                      value: Get.find<AttendanceController>().selectedYear,
                      onChanged: (String value) {
                        setState(() {
                          Get.find<AttendanceController>().selectedYear = value;
                        });
                      }),
                  SizedBox(
                    width: sizeConfig.width(.15),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.white,
                    items: kMonths
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                    value: Get.find<AttendanceController>().selectedMonth,
                    onChanged: (String value) {
                      setState(() {
                        Get.find<AttendanceController>().selectedMonth = value;
                      });
                      Get.find<AttendanceController>().loadAttendanceHistory();
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.04),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.03),
                  horizontal: sizeConfig.width(.04),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Date',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      width: sizeConfig.width(.02),
                    ),
                    Text(
                      'Time In',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      width: sizeConfig.width(.02),
                    ),
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              Container(
                height: sizeConfig.height(.5),
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.04),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.03),
                  horizontal: sizeConfig.width(.04),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                  future:
                      Get.find<AttendanceController>().loadAttendanceHistory(),
                  builder: (context, value) {
                    if (!value.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else if (value.hasError)
                      return Center(
                        child: Text('Could not Load Data'),
                      );
                    else
                      return ListView.builder(
                        itemCount: value.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            AttendanceHistoryWidget(
                          history: value.data[index],
                        ),
                      );
                  },
                ),
              )
            ],
          ),
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();
}

class AttendanceHistoryWidget extends StatelessWidget {
  final AttendanceHistory history;

  const AttendanceHistoryWidget({Key key, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: sizeConfig.height(.01),
        horizontal: sizeConfig.width(.08),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            history.date,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            history.creationTime,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            history.status,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
