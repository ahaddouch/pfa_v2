import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/core/view_model/auth_view_model.dart';

import 'auth/login_view.dart';
import 'home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
             ? LoginView()
          : HomeView();
    });
  }
}
