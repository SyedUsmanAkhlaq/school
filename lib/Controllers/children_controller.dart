import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/models.dart';

class ChildrenController extends GetxController {
  List<Children> _children;
  Child _child;

  List<Children> get children => _children;
  Child get child => _child;

  set children(List<Children> children) {
    _children = children;
    update();
  }

  set child(Child child) {
    _child = child;
    update();
  }

  Future loadChildrenData() async {
    _children = await APIInterface.childrenData();
    // printInfo(info: '$_children');
    return _children;
  }

  Future loadChildData() async {
    _child = await APIInterface.childData();
    // printInfo(info: '$_child');
    return _child;
  }
}
