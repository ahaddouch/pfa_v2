import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../service/home_services.dart';
class HomeViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  HomeViewModel(){
    getCategory();
  }
  getCategory() async{

    _loading.value = true;
    HomeService().getCategory().then((value) {
      for(int i = 0; i<value.length; i++){
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}