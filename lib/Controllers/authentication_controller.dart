import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/mixins.dart';

/// Created by Usman Akhlaq on 27.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class AuthenticationController extends GetxController with ProcessMixin {
  Future<bool> login(String email, String password) async {
    start();
    bool success = await APIInterface.login(email, password);
    stop();
    return success;
  }
}
