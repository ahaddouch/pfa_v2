
import 'package:get/get.dart';
import 'package:pfa_v2/core/view_model/control_view_model.dart';
import 'package:pfa_v2/view/home_view.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());

   

  }
}
