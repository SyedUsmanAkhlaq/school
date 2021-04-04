import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

/// Created by Usman Akhlaq on 30.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class VoucherController extends GetxController {
  List<Voucher> _vouchers;
  double _total = 0;

  List<Voucher> get voucher => _vouchers;
  double get total => _total;

  set voucher(List<Voucher> voucher) {
    _vouchers = voucher;
    update();
  }

  set total(double total) {
    _total = total;
    update();
  }

  void calculateTotal() {
    _vouchers.forEach((element) {
      _total += double.parse(element.amount);
      print('Voucher Controller: GETTER: Total Price: $_total');
    });
    update();
    // return _total;
  }

  Future loadData(String studentID) async {
    _vouchers = await APIInterface.getVouchers(studentID);
    calculateTotal();
    return _vouchers;
  }
}
