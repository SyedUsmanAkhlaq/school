/// Created by Usman Akhlaq on 10.02.2021
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Pages/enrolled_childern_page.dart';
import 'package:school/Utils/global.dart';

class VerificationPage extends StatelessWidget {
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
                child: Image.asset('assets/verification.png'),
              ),
              SizedBox(
                height: sizeConfig.height(.06),
              ),
              Container(
                child: Text(
                  'Sign Up',
                  style:
                      Theme.of(context).textTheme.button.copyWith(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.02),
                ),
                child: Text(
                  'Enter your credentials to Log in',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.06),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.13),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                height: sizeConfig.height(.02),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.13),
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                      Icons.lock_open,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.06),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Log In',
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
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   margin: EdgeInsets.symmetric(
              //     horizontal: sizeConfig.width(.08),
              //   ),
              //   padding: EdgeInsets.symmetric(
              //     vertical: sizeConfig.height(0.06),
              //     horizontal: sizeConfig.width(.1),
              //   ),
              //   child: Column(
              //     children: [
              //       PinCodeTextField(
              //         pinTheme: PinTheme(
              //           activeColor: Colors.blue,
              //           inactiveColor: Colors.grey[300],
              //         ),
              //         backgroundColor: Colors.white,
              //         appContext: context,
              //         length: 4,
              //         onChanged: (String value) {},
              //       ),
              //       SizedBox(
              //         height: sizeConfig.height(.02),
              //       ),
              //       ElevatedButton(
              //         onPressed: _goToEnrolledStudents,
              //         child: Text('Verify',
              //             style: Theme.of(context).textTheme.button),
              //         style: ButtonStyle(
              //           padding: MaterialStateProperty.resolveWith(
              //             (states) => EdgeInsets.symmetric(
              //               horizontal: sizeConfig.width(.25),
              //               vertical: sizeConfig.height(.018),
              //             ),
              //           ),
              //           shape: MaterialStateProperty.resolveWith(
              //             (states) => RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //           ),
              //           backgroundColor:
              //               MaterialStateProperty.resolveWith<Color>(
              //             (Set<MaterialState> states) {
              //               if (states.contains(MaterialState.pressed))
              //                 return Theme.of(context).primaryColor;
              //               return Theme.of(context)
              //                   .primaryColor; // Use the component's default.
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: sizeConfig.height(.02),
              ),
              // Text(
              //   'Re-send code in 02:39',
              //   style: Theme.of(context).textTheme.subtitle2.copyWith(
              //         color: Colors.white,
              //       ),
              // )
            ],
          ),
        ),
      );

  void _goToEnrolledStudents() {
    // Get.find<ParentController>().loadData();
    Get.to(
      EnrolledStudents(),
    );
  }
}
