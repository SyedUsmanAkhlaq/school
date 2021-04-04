import 'package:get/get.dart';
import 'package:school/Utils/api_interface.dart';
import 'package:school/Utils/global.dart';
import 'package:school/Utils/models.dart';

class ChildrenController extends GetxController {
  List<Children> _children;
  Child _child;
  Children selectedChildren;

  // Children get selectedChildren => _selectedChildren;
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

  // set selectedChildren(Children children) {
  //   _selectedChildren = selectedChildren;
  //   update();
  // }

  Future loadChildrenData() async {
    _children = await APIInterface.childrenData(token['loggedin_userid']);
    // printInfo(info: '$_children');
    return _children;
  }

  Future loadChildData(String studentID) async {
    _child = await APIInterface.childData(studentID);
    // printInfo(info: '$_child');
    return _child;
  }
}
