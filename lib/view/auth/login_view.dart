import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/view/auth/register_view.dart';

import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'exemple@emsi.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '**********',
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Forgot Password?',
                color: primaryColor,
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                onPress: () {
                  _formKey.currentState.save();

                  if (_formKey.currentState.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
                text: 'Sign In',
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {},
                imageName: 'assets/images/facebook.png',
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  controller.googleSignInMethod();
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
