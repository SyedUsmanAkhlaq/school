/// Created by Usman Akhlaq on 10.02.2021
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Pages/verification_page.dart';
import 'package:school/Utils/global.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _body(context),
      );

  _body(BuildContext context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: sizeConfig.safeArea.top,
          ),
          child: Column(
            children: [
              Container(
                height: sizeConfig.height(.3),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(90),
                  ),
                ),
                child: Image.asset('assets/register.png'),
              ),
              SizedBox(
                height: sizeConfig.height(.15),
              ),
              Container(
                child: Text(
                  'Hello,',
                  style:
                      Theme.of(context).textTheme.button.copyWith(fontSize: 30),
                ),
              ),
              Container(
                child: Text(
                  'Welcome',
                  style:
                      Theme.of(context).textTheme.button.copyWith(fontSize: 30),
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.1),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.13),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.06),
              ),
              ElevatedButton(
                onPressed: _goToVerificationPage,
                child: Text(
                  'Next',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(
                      horizontal: sizeConfig.width(.12),
                      vertical: sizeConfig.height(.015),
                    ),
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(10.0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled))
                        return Colors.purple;
                      return Colors.white; // Use the component's default.
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void _goToVerificationPage() => Get.to(
        VerificationPage(),
      );
}
