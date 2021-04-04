import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/children_controller.dart';
import 'package:school/Controllers/voucher_controller.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';
import 'package:school/Widgets/drawer.dart';

/// Created by Usman Akhlaq on 29.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    print('Dispose called');
    Get.find<VoucherController>().total = 0;
    super.dispose();
  }

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: sizeConfig.height(.05),
                bottom: sizeConfig.height(.01),
                left: sizeConfig.width(.04),
                right: sizeConfig.width(.04),
              ),
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.02),
                horizontal: sizeConfig.width(.03),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sr #',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Text(
                      'Fee Heads',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Text(
                      'Amount',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: sizeConfig.height(.4),
              child: FutureBuilder(
                future: Get.find<VoucherController>().loadData(
                    Get.find<ChildrenController>().selectedChildren.childID),
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
                          VoucherListItem(
                        voucher: value.data[index],
                        index: index + 1,
                        color: index % 2 == 0
                            ? Theme.of(context).primaryColor.withOpacity(.7)
                            : Colors.white,
                      ),
                    );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.08),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payable:',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeConfig.width(.04),
                      vertical: sizeConfig.height(.02),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GetBuilder<VoucherController>(
                      builder: (value) => Text(
                        'Rs. ${value.total}',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();
}

class VoucherListItem extends StatelessWidget {
  final Voucher voucher;
  final int index;
  final Color color;

  const VoucherListItem({Key key, this.voucher, this.index, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: sizeConfig.height(.01),
        horizontal: sizeConfig.width(.04),
      ),
      padding: EdgeInsets.symmetric(
        vertical: sizeConfig.height(.02),
        horizontal: sizeConfig.width(.03),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$index',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: index % 2 == 0 ? Colors.black : Colors.white,
                  ),
            ),
            VerticalDivider(
              thickness: 2,
              color: Colors.grey[600],
            ),
            Container(
              child: Text(
                voucher.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: index % 2 == 0 ? Colors.black : Colors.white,
                    ),
              ),
            ),
            VerticalDivider(
              thickness: 2,
              color: Colors.grey[600],
            ),
            Text(
              voucher.amount,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: index % 2 == 0 ? Colors.black : Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
