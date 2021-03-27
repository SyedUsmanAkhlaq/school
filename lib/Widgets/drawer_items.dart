import 'package:flutter/material.dart';
import 'package:school/Utils/global.dart';

class DrawerItems extends StatelessWidget {
  final String leadingIcon;
  final String label;
  final Function onTap;

  const DrawerItems({
    Key key,
    this.leadingIcon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: sizeConfig.height(.02),
            horizontal: sizeConfig.width(.04),
          ),
          child: Row(
            children: [
              if (leadingIcon != null)
                Container(
                  height: sizeConfig.height(.03),
                  width: sizeConfig.height(.03),
                  child: Image.asset(
                    leadingIcon,
                  ),
                ),
              if (leadingIcon != null)
                SizedBox(
                  width: sizeConfig.width(.06),
                ),
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),
      );
}
