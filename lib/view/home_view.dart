import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/view/auth/login_view.dart';
import 'package:pfa_v2/view/widgets/custom_buttom.dart';
import 'package:pfa_v2/view/widgets/custom_text.dart';

import '../constance.dart';
import '../core/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>[
    'men',
    'Electro',
    'clothes',
    'xxx',
    'yyy',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ListView(
          children: [
            CustomButton(
              text: "Exit",
              onPress: () {
                _auth.signOut();
                Get.offAll(LoginView());
              },
            ),
            _searchTextFormField(),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Categories",
            ),
            SizedBox(
              height: 20,
            ),
            _listViewCategory(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Best Selling",
                  fontSize: 18,
                ),
                CustomText(
                  text: "See all",
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _listViewProducts(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/vide2.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: names[index],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.asset(
                        'assets/images/vide1.png',
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Just for test",
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "test test test",
                  color: Colors.grey,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "\$999",
                  color: primaryColor,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  label: '',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/home.png',
                      fit: BoxFit.contain,
                      width: 30,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  label: '',
                  icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.contain,
                        width: 30,
                      )),
                ),
                BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Cart',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  label: '',
                  icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/cart.png',
                        fit: BoxFit.contain,
                        width: 30,
                      )),
                ),
              ],
              currentIndex: controller.navigatorValue,
              onTap: (index) => {
                controller.changeSelectedValue(index),
              },
            ));
  }
}
