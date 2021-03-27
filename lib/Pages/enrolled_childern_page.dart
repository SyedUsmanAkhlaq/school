import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Widgets/children_list_item.dart';

class EnrolledStudents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  _appBar(BuildContext context) => AppBar(
        title: Text(
          'Enrolled Children',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white),
        ),
        brightness: Brightness.dark,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      );

  _body() => Container(
        child: FutureBuilder(
          future: Get.find<ChildrenController>().loadChildrenData(),
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
                    ChildrenListItem(
                  children: value.data[index],
                ),
              );
          },
        ),
      );
}
