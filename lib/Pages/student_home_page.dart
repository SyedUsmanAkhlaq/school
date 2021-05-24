import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/attendance_controller.dart';
import 'package:school/Controllers/diary_controller.dart';
import 'package:school/Controllers/event_controller.dart';
import 'package:school/Controllers/exam_schedule_controller.dart';
import 'package:school/Pages/attendance_detail_page.dart';
import 'package:school/Pages/diary_detail_page.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';
import 'package:school/Widgets/attendance_details.dart';
import 'package:school/Widgets/date_selection_bar.dart';
import 'package:school/Widgets/drawer.dart';
import 'package:school/Widgets/home_work_list_tile.dart';
import 'package:school/Widgets/transparent_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentHomePage extends StatefulWidget {
  final Children children;

  StudentHomePage({Key key, this.children}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 50),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 10)
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    String date =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
    print(date);
    Get.find<AttendanceController>().loadAttendance(widget.children.childID);
    Get.find<DiaryController>().loadData(date, widget.children.childID);
    Get.find<EventController>().loadData(date);
    Get.find<ExamScheduleController>().loadData(child.classID, child.sectionID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(context),
        drawer: _drawer(),
        body: _body(context),
      );

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Home',
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
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.06),
                  left: sizeConfig.width(.04),
                  right: sizeConfig.width(.04),
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
                  children: [
                    _image(),
                    _details(context),
                    Spacer(),
                    Text(
                      widget.children.childClass,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: _goToAttendanceDetail,
                child: Container(
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
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.02),
                  vertical: sizeConfig.height(.02),
                ),
                height: sizeConfig.height(.3),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Result History'),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    SplineAreaSeries<_SalesData, String>(
                      splineType: SplineType.cardinal,
                      color: Theme.of(context).primaryColor,

                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Marks',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: false),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.04),
              ),
              _diary(),
              SizedBox(
                height: sizeConfig.height(.04),
              ),
              _events(),
              SizedBox(
                height: sizeConfig.height(.04),
              ),
              _examSchedule(),
              SizedBox(
                height: sizeConfig.height(.04) + sizeConfig.safeArea.bottom,
              ),
            ],
          ),
        ),
      );

  _image() => ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Container(
          // color: Colors.grey[200],
          child: FadeInImage(
            height: sizeConfig.height(.11),
            width: sizeConfig.height(.11),
            image: NetworkImage(widget?.children?.childImageURL),
            placeholder: MemoryImage(kTransparentImage),
            imageErrorBuilder:
                (BuildContext context, Object object, StackTrace trace) =>
                    Container(
              height: sizeConfig.height(.09),
              width: sizeConfig.height(.09),
              alignment: Alignment.center,
              color: Colors.black26,
              child: Text(
                'No\nImage',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );

  _details(BuildContext context) => Container(
        margin: EdgeInsets.only(
          left: sizeConfig.width(.02),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.children.childUserName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: sizeConfig.height(.01),
            ),
            Text(
              widget.children.childSection,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      );

  _diary() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.03),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.03),
                vertical: sizeConfig.height(.01),
              ),
              child: Row(
                children: [
                  Text(
                    'Diary',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  Spacer(),
                  Text(
                    '${DateTime.now().day} ${kMonths[DateTime.now().month - 1]}',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: sizeConfig.height(.01),
                right: sizeConfig.width(.03),
              ),
              alignment: Alignment.bottomRight,
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
            DateSelectionBar(onDateSelected: _onDateSelected),
            SizedBox(
              height: sizeConfig.height(.01),
            ),
            HomeWorkListTile(),
            GetBuilder<DiaryController>(
              builder: (value) => Visibility(
                visible: value.diary == null ? false : true,
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                    ),
                    onPressed: () => Get.to(
                      () => DiaryDetailPage(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _events() => GetBuilder<EventController>(
        builder: (value) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizeConfig.width(.03),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.03),
                  vertical: sizeConfig.height(.01),
                ),
                child: Row(
                  children: [
                    Text(
                      'Events',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 25,
                          ),
                    ),
                  ],
                ),
              ),
              DateSelectionBar(onDateSelected: _onDateSelected),
              SizedBox(
                height: sizeConfig.height(.01),
              ),
              Text(
                value.events.title,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: sizeConfig.height(.01),
              ),
            ],
          ),
        ),
      );

  _examSchedule() => GetBuilder<ExamScheduleController>(
        builder: (value) => Container(
          height: sizeConfig.height(.25),
          margin: EdgeInsets.symmetric(
            horizontal: sizeConfig.width(.03),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.03),
                  left: sizeConfig.width(.03),
                ),
                child: Text(
                  'Exam Schedule',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 25,
                      ),
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.01),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      ExamListTile(
                    examSchedule: value.events[index],
                  ),
                  itemCount: value.events.length,
                ),
              ),
            ],
          ),
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();

  void _goToAttendanceDetail() => Get.to(() => AttendanceDetailPage());
  void _onDateSelected(DateTime dateTime) => _loadData(dateTime);

  void _loadData(DateTime dateTime) {
    String convertedDate =
        "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    print('This is date $convertedDate');
    Get.find<DiaryController>()
        .loadData(convertedDate, widget.children.childID);
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ExamListTile extends StatelessWidget {
  final ExamSchedule examSchedule;

  const ExamListTile({Key key, this.examSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.03),
          vertical: sizeConfig.height(.02),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.02),
          vertical: sizeConfig.height(.01),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  examSchedule?.examName,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.grey,
                        fontSize: 25,
                      ),
                ),
                SizedBox(
                  width: sizeConfig.width(.02),
                ),
                // Text(
                //   'Mid Term',
                //   style: Theme.of(context).textTheme.subtitle2.copyWith(
                //         color: Colors.grey,
                //       ),
                // )
              ],
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.width(.04),
                    vertical: sizeConfig.height(.01),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    examSchedule.examDate,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                SizedBox(
                  width: sizeConfig.width(.02),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.width(.04),
                    vertical: sizeConfig.height(.01),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${examSchedule.timeStart}-${examSchedule.timeEnd}',
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
