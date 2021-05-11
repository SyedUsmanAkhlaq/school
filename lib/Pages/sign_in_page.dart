/// Created by Usman Akhlaq on 10.02.2021
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/authentication_controller.dart';
import 'package:school/Pages/enrolled_student_page.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Widgets/primary_button.dart';
import 'package:school/Widgets/process_handler.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: 'umarfaiz');
  final TextEditingController _passwordController =
      TextEditingController(text: 'admin123');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      ProcessHandler<AuthenticationController>(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: _body(context),
        ),
      );

  _body(BuildContext context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: sizeConfig.safeArea.top,
          ),
          child: Form(
            key: _formKey,
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
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 30),
                  ),
                ),
                Container(
                  child: Text(
                    'Welcome',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 30),
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    // validator: (String input) => input == null || input.isEmpty
                    //     ? "Please enter your email address."
                    //     : input.contains(
                    //             RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
                    //         ? null
                    //         : "Please enter a valid email address.",
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
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (String input) => input == null || input.isEmpty
                        ? "Please enter your password."
                        : null,
                  ),
                ),
                SizedBox(
                  height: sizeConfig.height(.06),
                ),
                PrimaryButton(
                  label: 'Next',
                  onPress: _goToEnrolledStudents,
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.width(.09),
                  ),
                  borderRadius: 30,
                ),
              ],
            ),
          ),
        ),
      );

  void _goToEnrolledStudents() async {
    print(_emailController.text);
    print(_passwordController.text);
    if (_formKey.currentState.validate()) {
      bool success = await Get.find<AuthenticationController>()
          .login(_emailController.text, _passwordController.text);
      if (success)
        Get.to(
          () => EnrolledStudents(),
        );
    }
  }
}
