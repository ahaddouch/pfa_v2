import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfa_v2/helper/local_storage_data.dart';

class Profile extends GetxController{

    final LocalStorageData localStorageData = Get.find();

    Future<void> signOut()async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

}