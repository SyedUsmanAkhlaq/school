import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/mixins.dart';

/// Created by Usman Akhlaq on 17.04.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class ProcessHandler<T extends GetxController> extends StatelessWidget {
  final Widget child;

  const ProcessHandler({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (T bloc) => Container(
        child: Stack(
          children: [
            child,
            if ((bloc as ProcessMixin).loading)
              // if (value.loading)
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.3),
                ),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: sizeConfig.height(.1),
                    width: sizeConfig.height(.1),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
