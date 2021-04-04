import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/global.dart';

/// Created by Usman Akhlaq on 27.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class AuthenticationController extends GetxController {
  Future<bool> login(String email, String password) async {
    try {
      String _tokenString = await APIInterface.login(email, password);
      token = JwtDecoder.decode(_tokenString);
      // print(token);
      return true;
    } catch (e) {
      return false;
    }
  }
}
