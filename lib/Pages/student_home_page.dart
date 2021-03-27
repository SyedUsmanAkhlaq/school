import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/attendance_controller.dart';
import 'package:school/Pages/attendance_detail_page.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';
import 'package:school/Widgets/attendance_details.dart';
import 'package:school/Widgets/drawer.dart';
import 'package:school/Widgets/transparent_image.dart';

class StudentHomePage extends StatelessWidget {
  final Children children;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StudentHomePage({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(context),
      drawer: _drawer(),
      body: _body(context),
    );
  }

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
                    // _image(),
                    _details(context),
                    Spacer(),
                    Text(
                      children.childClass,
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
                      init: AttendanceController(),
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
            image: NetworkImage(children.childImageURL),
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
              children.childUserName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: sizeConfig.height(.01),
            ),
            Text(
              children.childSection,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();
  void _goToAttendanceDetail() => Get.to(AttendanceDetailPage());
}
