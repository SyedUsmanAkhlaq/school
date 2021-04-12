import 'package:flutter/material.dart';
import 'package:school/Utils/constants.dart';
import 'package:school/Utils/global.dart';

/// Created by Usman Akhlaq on 12.04.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class HomeWorkListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeConfig.width(.04),
        vertical: sizeConfig.height(.03),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor.withOpacity(.3),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: sizeConfig.height(.02),
              left: sizeConfig.width(.03),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'HomeWork',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
            ),
          ),
          SizedBox(
            height: sizeConfig.height(.06),
          ),
          Row(
            children: List.generate(
              4,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.02),
                  horizontal: sizeConfig.width(.02),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.02),
                  vertical: sizeConfig.height(.02),
                ),
                child: Text(
                  subjectName[index],
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
