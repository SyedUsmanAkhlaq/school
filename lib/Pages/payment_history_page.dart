import 'package:flutter/material.dart';
import 'package:school/Widgets/drawer.dart';

/// Created by Usman Akhlaq on 29.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class PaymentHistoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(context),
      drawer: _drawer(),
      body: _body(),
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

  _body() => Container(
        child: Center(
          child: Text('Payment History Page'),
        ),
      );

  void _openDrawer() => _scaffoldKey.currentState.openDrawer();
}
