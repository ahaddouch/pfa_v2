
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfa_v2/model/user_model.dart';

import '../../view/home_view.dart';
import '../service/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;


  String email, password, name;

  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(HomeView());
    });

  }
  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar("Error login account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((user){
        saveUser(user);
      });

      Get.offAll(HomeView());
    } catch (e) {

      Get.snackbar("Error login account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name ?? user.user.displayName,
      pic: '',
    ));
  }
}
