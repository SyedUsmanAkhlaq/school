import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';

/// Created by Musa Usman on 07.08.2020
/// Copyright © 2020 Musa Usman. All rights reserved.

class DateSelectionBar extends StatefulWidget implements PreferredSizeWidget {
  final OnDateSelected onDateSelected;

  DateSelectionBar({Key key, @required this.onDateSelected}) : super(key: key);

  @override
  _DateSelectionBarState createState() => _DateSelectionBarState();

  @override
  Size get preferredSize => Size.fromHeight(
        kTextTabBarHeight * 1.5 + sizeConfig.height(.035),
      );
}

class _DateSelectionBarState extends State<DateSelectionBar> {
  DateTime _selectedDateTime = DateTime.now();
  List<DateTime> _dates = <DateTime>[];

  @override
  void initState() {
    _dates = List.generate(
      14,
      (index) => _selectedDateTime.add(
        Duration(days: index),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: _bar(),
          ),
        )
      : _bar();

  _bar() => Container(
        height: widget.preferredSize.height,
        color: Platform.isIOS
            ? Theme.of(context).cupertinoOverrideTheme.barBackgroundColor
            : Theme.of(context).appBarTheme.color,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _dates.length,
          padding: EdgeInsets.only(
            left: sizeConfig.width(.01),
            right: sizeConfig.width(.01),
          ),
          itemBuilder: (_, int index) => _ListItem(
            index: index,
            dateTime: _dates[index],
            selectedDateTime: _selectedDateTime,
            onTap: () => _onItemSelected(_dates[index]),
          ),
        ),
      );

  void _onItemSelected(DateTime dateTime) {
    setState(() {
      _selectedDateTime = dateTime;
    });
    widget.onDateSelected(dateTime);
  }
}

class _ListItem extends StatefulWidget {
  final int index;
  final DateTime dateTime;
  final DateTime selectedDateTime;
  final GestureTapCallback onTap;

  const _ListItem({
    Key key,
    @required this.selectedDateTime,
    @required this.dateTime,
    @required this.index,
    @required this.onTap,
  }) : super(key: key);

  @override
  __ListItemState createState() => __ListItemState();
}

class __ListItemState extends State<_ListItem> {
  bool get _isSelected => widget.selectedDateTime == widget.dateTime;

  bool get _isCurrentDate {
    DateTime _currentDateTime = DateTime.now();
    return _currentDateTime.month == widget.dateTime.month &&
        _currentDateTime.day == widget.dateTime.day;
  }

  BorderRadius _borderRadius = BorderRadius.circular(21);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onTap,
        child: Container(
          width: sizeConfig.width(1) / 7.7,
          padding: EdgeInsets.only(
            bottom: sizeConfig.height(.0225),
            top: sizeConfig.height(.025),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ///Weekday Short
              Text(
                kWeekdaysShort[widget.dateTime.weekday - 1],
                style: Theme.of(context).textTheme.caption.copyWith(),
              ),

              ///Date
              Stack(
                children: <Widget>[
                  ///Background Color Fill Shape
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: _borderRadius,
                        ),
                        width: _isSelected ? sizeConfig.width(.12) : 0,
                        height: _isSelected ? sizeConfig.width(.12) : 0,
                      ),
                    ),
                  ),

                  ///Outline Border Shape
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          borderRadius: _borderRadius,
                          border: Border.all(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(_isCurrentDate ? 1 : 0),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///Date Text
                  Container(
                    width: sizeConfig.width(.1),
                    height: sizeConfig.width(.1),
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: _isSelected ? Colors.white : null,
                            ),
                        child: Text(widget.dateTime.day.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

typedef void OnDateSelected(DateTime dateTime);
