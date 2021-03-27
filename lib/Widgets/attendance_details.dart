import 'package:flutter/material.dart';
import 'package:school/Utils/global.dart';

class AttendanceDetail extends StatelessWidget {
  final String heading;
  final int value;
  final Color color;

  const AttendanceDetail({Key key, this.heading, this.value, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(heading),
          SizedBox(
            height: sizeConfig.height(.02),
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontSize: 20,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
