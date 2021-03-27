/// Created by Usman Akhlaq on 10.02.2021
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:school/Controllers/children_controller.dart';
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
                  'Verification,',
                  style:
                      Theme.of(context).textTheme.button.copyWith(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.02),
                ),
                child: Text(
                  'Enter A 4 Digit Number That\nWas Sent To + (1) 555 678 2810',
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.08),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(0.06),
                  horizontal: sizeConfig.width(.1),
                ),
                child: Column(
                  children: [
                    PinCodeTextField(
                      pinTheme: PinTheme(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[300],
                      ),
                      backgroundColor: Colors.white,
                      appContext: context,
                      length: 4,
                      onChanged: (String value) {},
                    ),
                    SizedBox(
                      height: sizeConfig.height(.02),
                    ),
                    ElevatedButton(
                      onPressed: _goToEnrolledStudents,
                      child: Text('Verify',
                          style: Theme.of(context).textTheme.button),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.symmetric(
                            horizontal: sizeConfig.width(.25),
                            vertical: sizeConfig.height(.018),
                          ),
                        ),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context).primaryColor;
                            return Theme.of(context)
                                .primaryColor; // Use the component's default.
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeConfig.height(.02),
              ),
              Text(
                'Re-send code in 02:39',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.white,
                    ),
              )
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
