import 'package:get/get.dart';

/// Created by Usman Akhlaq on 17.04.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

mixin ProcessMixin on GetxController {
  bool loading = false;

  void start() {
    loading = true;
    update();
  }

  void stop() {
    loading = false;
    update();
  }
}
