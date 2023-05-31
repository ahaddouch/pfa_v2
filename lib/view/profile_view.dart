import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/core/view_model/profile_view_model.dart';
import 'package:pfa_v2/view/auth/login_view.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder:(controller)=> Scaffold(
        body: Container(
          child: Center(
            child: TextButton(
              onPressed:(){
                controller.signOut();
                Get.offAll(LoginView());
              },
              child: Text("SignOut"),
            ),
          ),
        ),
      ),
    );
  }
}
