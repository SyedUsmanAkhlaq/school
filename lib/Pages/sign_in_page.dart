/// Created by Usman Akhlaq on 10.02.2021
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/Controllers/authentication_controller.dart';
import 'package:school/Pages/enrolled_childern_page.dart';
import 'package:school/Utils/global.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: 'iamomerbhutta@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'admin');

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
                  controller: _passwordController,
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
              // ElevatedButton(
              //   onPressed: _goToEnrolledStudents,
              //   child: Text(
              //     'Next',
              //     style: Theme.of(context)
              //         .textTheme
              //         .button
              //         .copyWith(color: Theme.of(context).primaryColor),
              //   ),
              //   style: ButtonStyle(
              //     padding: MaterialStateProperty.resolveWith(
              //       (states) => EdgeInsets.symmetric(
              //         horizontal: sizeConfig.width(.12),
              //         vertical: sizeConfig.height(.015),
              //       ),
              //     ),
              //     shape: MaterialStateProperty.resolveWith(
              //       (states) => RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //     elevation: MaterialStateProperty.all(10.0),
              //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
              //       (Set<MaterialState> states) {
              //         if (states.contains(MaterialState.disabled))
              //           return Colors.purple;
              //         return Colors.white; // Use the component's default.
              //       },
              //     ),
              //   ),
              // ),
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
      );

  void _goToEnrolledStudents() async {
    print(_emailController.text);
    print(_passwordController.text);
    bool success = await Get.find<AuthenticationController>()
        .login(_emailController.text, _passwordController.text);
    if (success)
      Get.to(
        EnrolledStudents(),
      );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const PrimaryButton({
    Key key,
    @required this.label,
    @required this.onPress,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (states) => padding ?? EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          elevation: MaterialStateProperty.all(elevation ?? 0),
        ),
      ),
    );
  }
}

class ProcessHandler extends StatefulWidget {
  final Widget child;

  const ProcessHandler({Key key, this.child}) : super(key: key);
  @override
  _ProcessHandlerState createState() => _ProcessHandlerState();
}

class _ProcessHandlerState extends State<ProcessHandler> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
