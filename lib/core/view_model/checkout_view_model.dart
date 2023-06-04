import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/view/control_view.dart';
import '../../constance.dart';

class CheckOutViewModel extends GetxController{

  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.deliveryTime;

  void changeIndex(int i) {
    _index = i;
    if(_index == 1){
      _pages = Pages.addAddress;
    }
    else if(_index == 2){
      _pages = Pages.summary;
    }
    else if(_index == 3){
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    }
    else if (i < _index) {
      return Colors.green;
    }
    return todoColor;
  }
}